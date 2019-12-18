//
//  PhoneCallView.swift
//  MrLove
//
//  Created by User20 on 2019/10/25.
//  Copyright © 2019 User23. All rights reserved.
//

import SwiftUI

struct PhoneCallView: View {
    init(){
        UITableView.appearance().backgroundColor = .clear
    }
    @State private var animationAmount = 0.0
    @EnvironmentObject var PhoneRing : phoneRing
    //@State var PhoneRing = false
    //@EnvironmentObject var PhoneRing: PhoneRing
    @State var AnswerThePhone = false
    @State private var expandDatePick = false
    @State private var selectTime = Date()
    let dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
       dateFormatter.timeStyle = .short
       return dateFormatter
    }()
    
    @State private var chatArr = ["車教授...你怎麼有我的電話？","嗯？你今天早上不就打給我了嗎？","我快要到你們公司了","我們要約幾點呢？","好了","好，那我們待會見"]
    @State private var chatArrIndex = 0
    var body: some View {
        ZStack(alignment: .bottom){
            if AnswerThePhone == true{
            Image("2019-10-6_ 13-19-42").resizable().scaledToFill().frame(minWidth: 0, maxWidth: .infinity)
            }
            else{
                Image("黑幕").resizable().scaledToFill().frame(minWidth: 0, maxWidth: .infinity)
            }
        ZStack(alignment: .bottom){

            if PhoneRing.PhoneRing == true{
           Image("eunwoo來電").resizable().scaledToFill().frame(minWidth: 0, maxWidth: .infinity)
            }
            //if AnswerThePhone == true{
            VStack(spacing:30){
                if AnswerThePhone == true{
                    HStack(alignment: .top,spacing: 20){
                        if chatArrIndex == 0 || chatArrIndex == 4{ Image("tia頭框").resizable().scaledToFill().frame(width:75,height: 75).cornerRadius(75).offset(y:33)
                        }
                        else {
                            Image("eunwoo頭像").resizable().scaledToFill().frame(width:75,height: 75).cornerRadius(75).offset(y:33)
                        }
                    Form {
                        Section(header: Text("")) {
                            HStack{
                            if chatArrIndex == 4{
                                Text(dateFormatter.string(from: selectTime))
                            }
                    Text(chatArr[chatArrIndex])
                            }
                            HStack{
                                if chatArrIndex == 4{
                                Toggle(isOn: $expandDatePick) {
                                    if expandDatePick{
                                        Text("展開")
                                    }
                                    else{
                                        Text("不展開")
                                    }
                                    }.frame(width:110,height:40)
                                }
                                Image("nextbutton").renderingMode(.original).resizable().frame(width: UIScreen.main.bounds.width*2/3-210,height:40).hidden()
                        Button(action:{
                            if self.chatArrIndex < 5{
                            self.chatArrIndex += 1
                            }
                        }){
                           if self.chatArrIndex < 5{
                            Image("nextbutton").renderingMode(.original).resizable().scaledToFit().frame(height:40)
                            }
                        }
                        }
                        }
                        if expandDatePick && chatArrIndex == 4{
                            Section{
                                DatePicker("時間", selection: self.$selectTime, displayedComponents: .hourAndMinute)
                            }
                        }
                    }.frame(width: UIScreen.main.bounds.width*2/3, height: 250)
                }
                }
                if PhoneRing.PhoneRing == true{
                    answerPhoneButton(AnswerThePhone: $AnswerThePhone,animationAmount: $animationAmount)
                }
                Image("劇情").resizable().scaledToFit().frame(height:180).hidden()
            }
            
        }.edgesIgnoringSafeArea(.all)
            
    }.edgesIgnoringSafeArea(.all)
    }
}

//class phoneRing: ObservableObject {
//    @Published var PhoneRing: Bool = false
//}

struct PhoneCallView_Previews: PreviewProvider {
    static let PhoneRing = phoneRing()
    static var previews: some View {
        PhoneCallView().environmentObject(PhoneRing)
    }
}

struct answerPhoneButton: View {
    @Binding var AnswerThePhone : Bool
    @Binding var animationAmount : Double
    
    @State var isanimate = 0
    @State var arr = ["phonering","hangup"]
    var body: some View {
        Button(action:{
            if self.AnswerThePhone == false {
                withAnimation(.easeOut(duration: 1)){
                    self.animationAmount -= 360
                }
                DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                    self.isanimate = 1
                    self.AnswerThePhone = true

                }
            }
            else if self.AnswerThePhone == true {
                withAnimation(.easeOut(duration: 1)){
                    self.animationAmount += 360
                }
                DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                    self.isanimate = 0
                    self.AnswerThePhone = false

                }
            }
        }){

            Image(arr[isanimate]).renderingMode(.original).resizable().scaledToFit().frame(width:70).rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0)).opacity(1)

        }
    }
}
