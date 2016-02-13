//
//  ViewController.swift
//  Clap
//
//  Created by 南部　匡寛 on 2016/02/12.
//  Copyright © 2016年 南部匡寛. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var clapPickerView: UIPickerView!
    var audioPlayer: AVAudioPlayer!
    var soundCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let soundFilePath = NSBundle.mainBundle().pathForResource("clap", ofType: "wav")!
        let fileURL = NSURL(fileURLWithPath: soundFilePath)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOfURL: fileURL)
        }catch {
            print("ファイルを読み込めませんでした。")
        }
        clapPickerView.delegate = self
        clapPickerView.dataSource = self
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int)-> Int {
        return 10
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row + 1)回"
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        soundCount = row
    }
    
    @IBAction func playButton() {
        audioPlayer.numberOfLoops = soundCount
        audioPlayer.play()
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

