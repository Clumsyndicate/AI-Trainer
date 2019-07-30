//
//  PagesViewController.swift
//  AI Trainer
//
//  Created by Zhu Scott on 2019/7/30.
//  Copyright © 2019 Zhu Scott. All rights reserved.
//

import UIKit
import AVKit

class PagesViewController: UIViewController {
    
    var url: URL!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let player = AVPlayer(url: url)
        let vc = AVPlayerViewController()
        vc.player = player
        
        present(vc, animated: true) {
            vc.player?.play()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
