//
//  MusicHelper.swift
//  BookOfChanges
//
//  Created by Evgeniy Suprun on 28.12.2019.
//  Copyright © 2019 Evgeniy Suprun. All rights reserved.
//

import AVFoundation

class MusicHelper {
    
    static let sharedHelper = MusicHelper()
    var audioPlayer: AVAudioPlayer?

    func playBackgroundMusic() {
        let aSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "music", ofType: "mp3")!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf:aSound as URL)
            audioPlayer!.numberOfLoops = -1
            audioPlayer!.prepareToPlay()
            audioPlayer!.volume = 0.1
            audioPlayer!.play()
        } catch {
            print("Cannot play the file")
        }
    }
}
