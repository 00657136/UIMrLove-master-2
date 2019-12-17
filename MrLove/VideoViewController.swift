//
//  VideoViewController.swift
//  MrLove
//
//  Created by User18 on 2019/12/6.
//  Copyright © 2019 User23. All rights reserved.
//

import UIKit
import SwiftUI
import AVFoundation
import AVKit
class VideoViewController: UIViewController {
 var looper: AVPlayerLooper?
    override func viewDidLoad() {
        super.viewDidLoad()
    
        NameButton.clipsToBounds = true
        NameButton.layer.cornerRadius = 10
        
        guard let path = Bundle.main.path(forResource: "SignTheName", ofType:"mp4") else {
            debugPrint("SignTheName.mp4 not found")
            return
        }
        let item = AVPlayerItem(url: URL(fileURLWithPath: path))
        let player = AVQueuePlayer()
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = .resizeAspectFill
       
        playerLayer.frame = ViewVideo.bounds
        view.layer.insertSublayer(playerLayer,at: 0)
        looper = AVPlayerLooper(player: player, templateItem: item)
        
        
        player.play()
        

    }
  
    @IBOutlet var ViewVideo: UIView!
    @IBOutlet weak var NameTextField: UITextField!
    
    @IBOutlet weak var NameButton: UIButton!
    
    @IBAction func TurnToTia(_ sender: Any) {
    }

    

   
    
    
    @IBSegueAction func nextpage(_ coder: NSCoder) -> UIViewController? {
        let NameString:String = NameTextField.text!
        let contentView = TiaPageView(content: NameString,fontnumber: 26,selectBackGround: 0)
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
