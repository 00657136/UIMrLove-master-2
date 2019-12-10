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
       TabView{
        
        PhoneCallView().tabItem{
            Image(systemName: "phone.fill")
            Text("來電")
        }
            PhoneChatView().tabItem{
                Image(systemName: "message.fill")
                Text("聊天")
            }
            
        }
    }
}

struct PhoneTabView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneTabView()
    }
}
