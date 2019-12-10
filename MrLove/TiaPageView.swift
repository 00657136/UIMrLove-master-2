//
//  TiaPageView.swift
//  MrLove
//
//  Created by User20 on 2019/10/25.
//  Copyright © 2019 User23. All rights reserved.
//

import SwiftUI

struct TiaPageView: View {
    var content: String
    @State private var showPhoneTabView = false
    var body: some View {
        NavigationView{
        ZStack(alignment: .center){
            
            Image("個人頁面").resizable().scaledToFill().frame(minWidth: 0, maxWidth: .infinity)
            VStack(alignment: .leading, spacing: 5){
               NavigationLink(destination: SettingView(content: content)){
                Image("tia頭像").renderingMode(.original).resizable().scaledToFit().frame(width:250).offset(x:5).overlay(Text(content).foregroundColor(Color("TiaColor")).font(.title).offset(x:-70,y:105))
            }
                HStack{
                    Image("劇情").resizable().scaledToFit().frame(width:180).hidden()
                    NavigationLink(destination: ContentView(content: content)){
                    Image("劇情").renderingMode(.original).resizable().scaledToFit().frame(width:230)
                    }
                
                }
               //HStack{
//               NavigationLink(destination: PhoneTabView()){
//                Image("手機").renderingMode(.original).resizable().scaledToFit().frame(width:200)
//                }
                
                 Image("手機").renderingMode(.original).resizable().scaledToFit().frame(width:200)
                    .onTapGesture {
                        self.showPhoneTabView = true
                }
               //Image("劇情").resizable().scaledToFit().frame(width:180).hidden()
                
                //}
            }
        }.edgesIgnoringSafeArea(.all).sheet(isPresented: $showPhoneTabView) {
            PhoneTabView()
        }
            
        }
    }
}



struct TiaPageView_Previews: PreviewProvider {
    static var previews: some View {
        TiaPageView(content: "Tia")
    }
}
