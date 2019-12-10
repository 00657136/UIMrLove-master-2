//
//  NameView.swift
//  MrLove
//
//  Created by User18 on 2019/12/4.
//  Copyright © 2019 User23. All rights reserved.
//

import SwiftUI
import AVKit
struct NameView: View {
    @State private var name = ""
   let toPresent = UIHostingController(rootView: AnyView(EmptyView()))
   @State private var vURL = URL(string: "https://bit.ly/2Yn0y6L")
    
    var body: some View {
        ZStack(alignment: .center){
            player().scaledToFill().frame(minWidth: 0, maxWidth: .infinity)
            //PlayerView(player: AVPlayer(url: URL(string: "https://www.youtube.com/watch?v=Q-O2bjqWrfs")!))
//            PlayerView(player: AVPlayer(url: URL(string: "https://bit.ly/2Yn0y6L")!)).scaledToFill().frame(minWidth: 0, maxWidth: .infinity)
            VStack(alignment: .center, spacing: 15){
                Image("劇情").resizable().scaledToFit().frame(width:180).hidden()
                TextField("請輸入你的名字", text: $name).background(Color.white)
                    .background(RoundedRectangle(cornerRadius: 0).stroke(Color.black, lineWidth: 5).foregroundColor(Color.white))
                .padding()
                Button("簽好了"){
                    
                }
            }
            
        }.edgesIgnoringSafeArea(.all)
    }
}


struct NameView_Previews: PreviewProvider {
    static var previews: some View {
        NameView()
    }
}

//struct AVPlayerView: UIViewControllerRepresentable {
//    @State private var looper: AVPlayerLooper?
//    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: UIViewControllerRepresentableContext<AVPlayerView>) {
//
//    }
//
//    func makeUIViewController(context: UIViewControllerRepresentableContext<AVPlayerView>) -> AVPlayerViewController {
//                        let controller = AVPlayerViewController()
//                      if let url = URL(string: "https://bit.ly/2Yn0y6L") {
//                       let item = AVPlayerItem(url: url)
//                       let player = AVQueuePlayer()
//                       looper = AVPlayerLooper(player: player, templateItem: item)
//                       //let playerViewController = AVPlayerViewController()
//                       controller.player = player
//                       controller.player?.play()
//                        //return playerViewController
//                    }
//
//     return controller
//    }
//}

struct player : UIViewControllerRepresentable{
    @State private var looper: AVPlayerLooper?
    func makeUIViewController(context: UIViewControllerRepresentableContext<player>) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        let url = "https://bit.ly/2Yn0y6L"
        let player1 = AVPlayer(url: URL(string: url)!)
        
        let url2 = URL(string: "https://bit.ly/2Yn0y6L")
        let player2 = AVQueuePlayer()
        let item = AVPlayerItem(url: url2!)
            looper = AVPlayerLooper(player: player2, templateItem: item)
        
        //controller.modalPresentationStyle = .fullScreen
        controller.player = player1
        return controller
    }
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: UIViewControllerRepresentableContext<player>) {

    }
}

//struct PlayerView: UIViewRepresentable {
//  let player: AVPlayer
//  func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {
//  }
//  func makeUIView(context: Context) -> UIView {
//    return PlayerUIView(player: player)
//  }
//}
//
//class PlayerUIView: UIView {
//  private let playerLayer = AVPlayerLayer()
//  override init(frame: CGRect) {
//    super.init(frame: frame)
//
//    let url = URL(string: "https://bit.ly/2Yn0y6L")!
//    let player = AVPlayer(url: url)
//    player.play()
//
//    playerLayer.player = player
//    layer.addSublayer(playerLayer)
//  }
//    init(player: AVPlayer) {
//      super.init(frame: .zero)
//      playerLayer.player = player
//      layer.addSublayer(playerLayer)
//    }
//  required init?(coder: NSCoder) {
//   fatalError("init(coder:) has not been implemented")
//  }
//  override func layoutSubviews() {
//    super.layoutSubviews()
//    playerLayer.frame = bounds
//  }
//}

