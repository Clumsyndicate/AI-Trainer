//
//  FeedbackViewController.swift
//  AI Trainer
//
//  Created by Zhu Scott on 2019/7/30.
//  Copyright © 2019 Zhu Scott. All rights reserved.
//

import UIKit
import AVKit
import SocketIO

class FeedbackViewController: UIViewController {

    var networking: Networking!
    var socket: SocketIOClient!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let networking = Networking(address: "http://10.20.69.32:5000")
        
        networking.addHandlers()
        networking.connect()
        networking.socket.on(clientEvent: .connect) { (data, ack) in
            print("Connected to Socket~!")
            networking.selectVid(videoName: "name")
        }
        let socket = networking.socket
        
        socket!.on("feedback") { (data, Ack) in
            self.playMusic(data: data[0] as! Data)
        }
    }
    
    @IBAction func startTraining(_ sender: UIButton) {
        socket.emit("practise")
    }
    var audio: AVAudioPlayer!
    
    func playMusic(data: Data) {
        
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("voice.mp3")
        
        do {
            try data.write(to: fileURL, options: .atomic)
        } catch {
            print("Error")
            print(error)
        }
        
        
        do{
            
            audio = try AVAudioPlayer(contentsOf: fileURL)
            audio.prepareToPlay()
            audio.play()
        }
        catch {
            print("Error")
        }
    }



}
