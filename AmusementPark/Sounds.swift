//
//  Sounds.swift
//  AmusementPark
//
//  Created by Andrea Salazar Santos on 6/2/19.
//  Copyright © 2019 SantosAndrea. All rights reserved.
//

import Foundation
import AVFoundation
class Sounds {
    var sound: AVAudioPlayer?
    func playSound (soundName: String){
        if soundName == "AccessGranted"{
        do{
            if let fileURL = Bundle.main.path(forResource: "AccessGranted", ofType: "wav") {
                sound = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileURL))
                sound?.play()
            } else {
                print("Error: No file with specified name exists")
            }
        } catch let error {
            print("Can't play the audio file failed with an error \(error.localizedDescription)")
        }
        }
    }
}
        

//learning sounds from
//https://www.hackingwithswift.com/example-code/media/how-to-play-sounds-using-avaudioplayer
//https://jayeshkawli.ghost.io/playing-audio-file-on-ios-with-swift/
