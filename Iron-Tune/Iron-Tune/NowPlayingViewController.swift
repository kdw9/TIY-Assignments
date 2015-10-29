//
//  ViewController.swift
//  Iron-Tune
//
//  Created by Keron Williams on 10/21/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class NowPlayingViewController: UIViewController
{
    @IBOutlet weak var songTitleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var albumArtwork: UIImageView!
    
    @IBOutlet var playPauseButton: UIButton!
    
    var songs = Array <Song>()
    var currentSong: Song?
    var nowPlaying: Bool = false
    
    let avQueuePlayer = AVQueuePlayer()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupAudioSession()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playPauseTapped(sender: UIButton)
    {
        
    }
    
    @IBAction func skipForwardTapped(sender: UIButton)
    {
    
    }
    @IBAction func skipBackwardTapped(sender: UIButton)
    {
    
    }

    // MARK: - Audio
    
    func setupAudioSession()
    {
        AVAudioSession.sharedInstance().requestRecordPermission({(granted: Bool) -> Void
    in
    if granted
            {
                do {
                    try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
                    }
                    catch _ {
                            }
                        do{
                            try AVAudioSession.sharedInstance().setActive(true)
                           }
                            catch _ {
                        }
    
                    }
                    else
                    {
              print("Audio Session coiuld not be configured; userdenied permission")
        }
    })
 
    func configuredPlauylist()
    {
        let = Song(title: "Happiness", artist: "Benjamin Tissort", filename: "happiness", albumArtwork: "Acoustic")
    }
}

