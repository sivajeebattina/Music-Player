//
//  MusicPlayerViewController.swift
//  MusicPlayer
//
//  Created by pcs20 on 10/27/14.
//  Copyright (c) 2014 Paradigmcreatives. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class MusicPlayerViewController: UIViewController,AVAudioPlayerDelegate {
    @IBOutlet var playButton:UIButton!
    
    var audioPlayer = AVAudioPlayer()
    var songName:NSString="bell"
    override func viewDidLoad() {
        super.viewDidLoad()

        
        var alertSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(songName, ofType: "wav")!)
        
        // Removed deprecated use of AVAudioSessionDelegate protocol
        AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, error: nil)
        AVAudioSession.sharedInstance().setActive(true, error: nil)
        
        var error:NSError?
        audioPlayer = AVAudioPlayer(contentsOfURL: alertSound, error: &error)
        audioPlayer.prepareToPlay()
        
        audioPlayer.delegate=self
       

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func playButtonClicked(){
        
        if audioPlayer.playing{
            var changeButtonImage=UIImage(named: "play.ico")
            self.playButton.setBackgroundImage(changeButtonImage, forState: UIControlState.Normal)
        
            audioPlayer.pause()
        }
        
        else{
        
            var changeButtonImage=UIImage(named: "pause.ico")
            self.playButton.setBackgroundImage(changeButtonImage, forState: UIControlState.Normal)
            
            audioPlayer.play()

        }
        
    }
    
    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer!, successfully flag: Bool){
        var changeButtonImage=UIImage(named: "play.ico")
        self.playButton.setBackgroundImage(changeButtonImage, forState: UIControlState.Normal)
        
    }
}
