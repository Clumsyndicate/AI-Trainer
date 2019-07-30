//
//  Networking.swift
//  AI Trainer
//
//  Created by Zhu Scott on 2019/7/29.
//  Copyright © 2019 Zhu Scott. All rights reserved.
//

import Foundation
import SocketIO

class Networking {
    var manager: SocketManager!
    var socket: SocketIOClient!
    var video: String!
    
    func connect() {
        manager.connect()
    }
    
    func addHandlers() {
        socket.onAny { (event) in
            print("Socket Event \(event.description)")
        }
        socket.on("update") {  (data, Ack) in
            print(data)
        }
        
    }
    
    func selectVid(videoName: String) {
        /*
        socket.emitWithAck("selectVideo", videoName).timingOut(after: 1.0) { (data) in
            print("Received JSON \(data)")
        } */
        socket.emit("practise", videoName)
    }
    
    func downloadVid(videoName: String) {
        
    }
    
    
    init(address: String) {
        manager = SocketManager(socketURL: URL(string:address)!, config: [.log(true)])
        let defaultNamespaceSocket = manager.defaultSocket
        socket = manager.socket(forNamespace: "/")
        
        
    }
}
