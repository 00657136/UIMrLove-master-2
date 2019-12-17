//
//  PhoneTabView.swift
//  MrLove
//
//  Created by User03 on 2019/11/26.
//  Copyright © 2019 User23. All rights reserved.
//

import SwiftUI

struct PhoneTabView: View {
    var body: some View {
        let PhoneRing = phoneRing()
       return TabView{
        
        PhoneCallView().tabItem{
            Image(systemName: "phone.fill")
            Text("來電")
        }
            PhoneChatView().tabItem{
                Image(systemName: "message.fill")
                Text("聊天")
            }
            
        }.accentColor(.init(red: 204/255, green: 113/255, blue: 120/255)).environmentObject(PhoneRing)
    }
}

class phoneRing: ObservableObject {
    @Published var PhoneRing: Bool = false
}


struct PhoneTabView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        PhoneTabView()
    }
}
