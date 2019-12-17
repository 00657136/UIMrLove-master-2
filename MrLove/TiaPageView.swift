//
//  TiaPageView.swift
//  MrLove
//
//  Created by User20 on 2019/10/25.
//  Copyright © 2019 User23. All rights reserved.
//

import SwiftUI

struct TiaPageView: View {
    
    
    @State var content: String
    @State var fontnumber: CGFloat
    @State var selectBackGround: Int 
    var roles = ["步道", "別墅", "響尾蛇酒吧"]
    @State private var showPhoneTabView = false
    var body: some View {
        NavigationView{
        ZStack(alignment: .center){
            
            Image(roles[selectBackGround]).resizable().scaledToFill().frame(minWidth: 0, maxWidth: .infinity)
            VStack(alignment: .leading, spacing: 5){
                NavigationLink(destination: SettingView(content: $content,fontnumber:  $fontnumber,selectBackGround: $selectBackGround)){
                    Image("tia頭像").renderingMode(.original).resizable().scaledToFit().frame(width:250).offset(x:5).overlay(Text(content).scaledFont(name: "", size: fontnumber).foregroundColor(Color("TiaColor")).font(.title).offset(x:-70,y:105))
            }
                HStack{
                    Image("劇情").resizable().scaledToFit().frame(width:180).hidden()
                    NavigationLink(destination: ContentView(selectBackGround: selectBackGround,fontnumber: fontnumber,content: content)){
                    Image("劇情").renderingMode(.original).resizable().scaledToFit().frame(width:230)
                    }
                
                }
                
                 Image("手機").renderingMode(.original).resizable().scaledToFit().frame(width:200)
                    .onTapGesture {
                        self.showPhoneTabView = true
                }
            }
        }.edgesIgnoringSafeArea(.all).sheet(isPresented: $showPhoneTabView) {
            PhoneTabView()
        }
            
        }
    }
}



struct TiaPageView_Previews: PreviewProvider {
    static var previews: some View {
        TiaPageView(content: "hello",fontnumber: 26,selectBackGround: 0)
    }
}
