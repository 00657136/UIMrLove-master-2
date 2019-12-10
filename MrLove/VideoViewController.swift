//
//  VideoViewController.swift
//  MrLove
//
//  Created by User18 on 2019/12/6.
//  Copyright © 2019 User23. All rights reserved.
//

import UIKit
import SwiftUI
import AVKit
class VideoViewController: UIViewController {
 var looper: AVPlayerLooper?
    override func viewDidLoad() {
        super.viewDidLoad()
    
        NameButton.clipsToBounds = true
        NameButton.layer.cornerRadius = 10
        
        let url = URL(string: "https://ppt.cc/mov/player.php")
        let item = AVPlayerItem(url: url!)
        let player = AVQueuePlayer()
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = .resizeAspectFill
       
        playerLayer.frame = ViewVideo.bounds
        view.layer.insertSublayer(playerLayer,at: 0)
        looper = AVPlayerLooper(player: player, templateItem: item)
        
        
        player.play()
        
//        if let url = URL(string: "https://bit.ly/2Yn0y6L") {
//        let item = AVPlayerItem(url: url)
//        let player = AVQueuePlayer()
//        let playerLayer = AVPlayerLayer(player: player)
//
//                playerLayer.videoGravity = .resizeAspectFill
//                view.layer.addSublayer(playerLayer)
//                playerLayer.frame = video.bounds
//        looper = AVPlayerLooper(player: player, templateItem: item)
//        let playerViewController = AVPlayerViewController()
//        playerViewController.player = player
//        present(playerViewController, animated: true, completion: {
//           playerViewController.player?.play()
//        })
//        }
        
        // Do any additional setup after loading the view.
    }
  
    @IBOutlet var ViewVideo: UIView!
    @IBOutlet weak var NameTextField: UITextField!
    
    @IBOutlet weak var NameButton: UIButton!
    
    @IBAction func TurnToTia(_ sender: Any) {
    }
    
    //var looper: AVPlayerLooper?
    

   
    
    
    @IBSegueAction func nextpage(_ coder: NSCoder) -> UIViewController? {
        let NameString:String = NameTextField.text!
        let contentView = TiaPageView(content: NameString)
        return UIHostingController(coder: coder, rootView: contentView)
    }
    
    /*
    // MARK: - Navigation
        "https://bit.ly/2Yn0y6L"
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
