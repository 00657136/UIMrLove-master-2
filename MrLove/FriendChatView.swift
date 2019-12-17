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
    
    @Binding var PhoneRing : Bool
    //@ObservedObject var PhoneRing = phoneRing()
    var body: some View {
        

            List{
                ExtractedView(content: content, friendindex: friendindex, friends: friends,PhoneRing: $PhoneRing)
        }
        .onAppear {
           UITableView.appearance().separatorColor = .clear
        }
            .navigationBarTitle(self.content)
    
    }
}

struct FriendChatView_Previews: PreviewProvider {
    static var previews: some View {
        FriendChatView(content: "Tia",friendindex: 0,friends: "Tia",PhoneRing: .constant(true))
    }
}

struct ExtractedView: View {
    var content : String
    var friendindex : Int
    var friends : String
    //var PhoneRing : phoneRing
    @Binding var PhoneRing : Bool
    @State private var showingSheet = false
    @State private var showAlert = false
    //@Binding var PhoneRing : Bool
    //var PhoneRing : Bool
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
                if self.content == "車銀優" && index == 7
                {
                    Text("請按我").position(x: UIScreen.main.bounds.width-50,y:50).onTapGesture {
                        self.PhoneRing = true
                        self.showAlert = true
                    }.alert(isPresented: self.$showAlert) { () -> Alert in
                       
                       return Alert(title: Text("車銀優來電"), dismissButton: .default(Text("我知道了")))
                    }
                }
                if self.content == "Lisa" && index == 8
                {
                    Text("我看不懂").position(x: UIScreen.main.bounds.width-70,y:50).onTapGesture {
                        self.showingSheet = true
                    }.actionSheet(isPresented: self.$showingSheet) {
                        ActionSheet(title: Text("想知道意思嗎？"), message: Text("那就去我的Medium找找看囉"), buttons: [.default(Text("我這就去！"))])
                    }
                }
                
                
            }
            
        }.listRowInsets(EdgeInsets())
    }
}
