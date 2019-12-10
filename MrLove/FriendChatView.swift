//
//  FriendChatView.swift
//  MrLove
//
//  Created by User18 on 2019/12/7.
//  Copyright © 2019 User23. All rights reserved.
//

import SwiftUI

struct FriendChatView: View {
    var content : String
    var friendindex : Int
    var friends : String
   
    var body: some View {
        

            List{
                ExtractedView(content: content, friendindex: friendindex, friends: friends)
        }
        .onAppear {
           UITableView.appearance().separatorColor = .clear
        }
            .navigationBarTitle(self.content)
    
    }
}

struct FriendChatView_Previews: PreviewProvider {
    static var previews: some View {
        FriendChatView(content: "Tia",friendindex: 0,friends: "Tia")
    }
}

struct ExtractedView: View {
    var content : String
    var friendindex : Int
    var friends : String
    
    func check(name: String,index: Int)->Bool{
        (name == "車銀優" && (index == 2 || index == 3 || index == 5 || index == 7)) ||
        (name == "我家小妹" && (index == 2 || index == 5 || index == 7)) ||
        (name == "Lisa" && (index == 2 || index == 5 || index == 8)) 
    }
   
    var body: some View {
        ForEach(1..<self.friendindex){(index) in
            ZStack(alignment: .leading){
                
                Image("\(self.content)聊天\(index)").resizable().scaledToFit().frame(width: UIScreen.main.bounds.width)
                
                    if self.check(name: self.content,index: index){
                    Image("\(self.friends)").resizable().scaledToFill().frame(width:70,height: 70).cornerRadius(70).offset(x:10)
                    }
                
                
            }
            
        }.listRowInsets(EdgeInsets())
    }
}
