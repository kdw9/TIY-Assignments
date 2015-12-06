//
//  ViewController.swift
//  MakeSomthingBeautiful
//
//  Created by Keron Williams on 12/5/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class AudioViewController: UIViewController
{

    @IBOutlet var comedianLabel: UILabel!
    @IBOutlet var albumArtwork: UIImageView!
    
    @IBOutlet var playPauseButton: UIButton!
    
    let avQueuePlayer = AVQueuePlayer()
    var jokes = Array<Joke>()
    var currentjoke: Joke?
    var nowPlaying: Bool = false
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupAudioSession()
        configurePlayList()
        loadCurrentJoke()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Action Handlers
    
    @IBAction func playPauseTapped(sender: UIButton)
    {
        togglePlayback(!nowPlaying)
    }
    
    @IBAction func skipForwardTapped(sender: UIButton)
    {
        let currentJokeIndex = (jokes as NSArray).indexOfObject(currentjoke!)
        let nextJoke: Int
        
        if currentJokeIndex + 1 >= jokes.count
        {
            nextJoke = 0
        }
        else
        {
            nextJoke = currentJokeIndex + 1
        }
        currentjoke = jokes[nextJoke]
        loadCurrentJoke()
        togglePlayback(true)
    }
    
    @IBAction func skipBackTapped(sender:UIButton)
    {
        avQueuePlayer.seekToTime(CMTimeMakeWithSeconds(0.0, 1))
        if !nowPlaying
        {
            togglePlayback(true)
        }
    }
    
    // MARK: - Private methods
    
    
    func configurePlayList()
    {
        let billBurr = Joke(title: "Standup", comic: "Bill Burr", filename: "billBurr", albumArtwork: "billBurr")
        jokes.append(billBurr)
        currentjoke = billBurr
        
        let jimGaffigan = Joke(title: "Hot Pockets", comic: "Jim Gaffigan", filename: "jimGaffigan", albumArtwork: "jimmy")
        jokes.append(jimGaffigan)
        
        let jimGaffiganA = Joke(title: "Hot Pockets A", comic: "Jim Gaffigan", filename: "jimGaffiganA", albumArtwork: "jimmyTwo")
        jokes.append(jimGaffiganA)
        
        let jimGaffiganB = Joke(title: "Hot Pockets B", comic: "Jim Gaffigan", filename: "jimGaffiganB", albumArtwork: "jimmyTree")
        jokes.append(jimGaffiganB)
        
        let kevin = Joke(title: "Top Ten", comic: "Kevin Hart", filename: "kevHart", albumArtwork: "kev")
        jokes.append(kevin)
        
        let kevinH = Joke(title: "Top Five", comic: "Kevin Hart", filename: "kevHartA", albumArtwork: "kevTwo")
        jokes.append(kevinH)
        
    }
    
    func loadCurrentJoke()
    {
        avQueuePlayer.removeAllItems()
        if let funnyjoke = currentjoke
        {
            funnyjoke.playerItem.seekToTime(CMTimeMakeWithSeconds(0.0, 1))
            avQueuePlayer.insertItem(funnyjoke.playerItem, afterItem: nil)
            comedianLabel.text = funnyjoke.title
            albumArtwork.image = UIImage(named: funnyjoke.albumArtworkName)
        }
    
    }
    func setupAudioSession()
    {
        AVAudioSession.sharedInstance().requestRecordPermission({(granted: Bool)-> Void in
            if granted
            {
                do {
                    try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
                } catch _ {
                }
                do {
                    try AVAudioSession.sharedInstance().setActive(true)
                } catch _ {
                }
            }
            else
            {
                print("Audio session could not be configured; user denied permission.")
            }
        })
    }


    func togglePlayback(play: Bool)
    {
        nowPlaying = play
        if play
        {
            playPauseButton.setImage(UIImage(named: "Pause"), forState: UIControlState.Normal)
            avQueuePlayer.play()
        }
        else
        {
            playPauseButton.setImage(UIImage(named: "Play"), forState: UIControlState.Normal)
            avQueuePlayer.pause()
        }
    }
}
