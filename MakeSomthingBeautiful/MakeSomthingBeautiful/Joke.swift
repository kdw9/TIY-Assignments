//
//  Joke.swift
//  MakeSomthingBeautiful
//
//  Created by Keron Williams on 12/6/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation
import AVFoundation

class Joke
{
    let title: String
    let comic: String
    let filename: String
    let albumArtworkName: String
    
    let playerItem: AVPlayerItem
    
    init(title: String, comic: String, filename: String, albumArtwork: String)
    {
        self.title = title
        self.comic = comic
        self.filename = filename
        self.albumArtworkName = albumArtwork
        self.playerItem = AVPlayerItem(URL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(filename, ofType: "mp3")!))
    }
}