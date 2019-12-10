//
//  PhoneChatView.swift
//  MrLove
//
//  Created by User03 on 2019/11/26.
//  Copyright © 2019 User23. All rights reserved.
//

import SwiftUI

struct PhoneChatView: View {
    var friendsName = ["車銀優","我家小妹","Lisa"]
    var friendindexArr = [8,9,9]
    var friends = ["eunwoo頭像","妹頭像","lisa頭像"]
    var body: some View {
        NavigationView {
        List(0..<3){(index) in
            HStack{
                NavigationLink(destination: FriendChatView(content: self.friendsName[index] , friendindex: self.friendindexArr[index] ,friends: self.friends[index])) {
               HStack(alignment: .center, spacing: 20){ Image(self.friends[index]).resizable().scaledToFill().frame(width:100,height: 100).cornerRadius(100)
                VStack(alignment: .leading, spacing: 5){
                Text(self.friendsName[index]).fixedSize(horizontal: true, vertical: false).font(.system(size:20))
                //Text("nothing")
                }
                }
            }
            }
        }.onAppear {
           UITableView.appearance().separatorColor = .clear
        }
            .navigationBarTitle("好友清單")
        }
        
    }
}

struct PhoneChatView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneChatView()
    }
}
