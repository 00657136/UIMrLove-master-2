//
//  ContentView.swift
//  MrLove
//
//  Created by User23 on 2019/10/8.
//  Copyright © 2019 User23. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var content: String
    var TiaName = [7,8,13,16,17,19,24,25,34,37,39,41,43,45,57,59,61,63,72,74,77,80,82,85,87,89,91,94]
    var BoyImages = ["街道","銀優樓梯空","銀優樓梯","銀優樓梯女孩","銀優樓梯","銀優辦公室空","銀優辦公室","銀優辦公室笑","銀優辦公室","","銀優辦公室空","銀優辦公室","銀優辦公室不滿","銀優辦公室","街道"]
    @State private var NameIndex : Int = 0
    //@Binding var NameIndex : Int
    @State private var textdia : Int = 1
    @State private var boyIndex : Int = 0
    @State private var isBelieve  = false
    var body: some View {
        ZStack(alignment: .center){
            Color.black

            Image(self.BoyImages[self.boyIndex]).resizable().scaledToFill().frame(minWidth: 0, maxWidth: .infinity)//.hidden()
            
          
            
            VStack(alignment: .trailing,spacing: 1){
                
                if textdia < 97 && textdia != 48{
                    Image("\(textdia)").resizable().scaledToFit().frame(width:400,height:200)}
                else if textdia == 48 {
                    //ZStack(alignment: .bottom){
                    Image("\(textdia)").resizable().scaledToFit().frame(width:400,height:200).overlay(
                       
                        Toggle(isOn: $isBelieve){
                            if isBelieve{
                                Text("相信").offset(x:300)
                            }
                            else{
                                Text("不相信").offset(x:290)
                            }
                    }.offset(x: -30, y: 45))
                    
                }
                else{
                    Image("\(textdia)").resizable().scaledToFit().frame(width:400,height:200).hidden()
                }
                    
                Button(action: {self.textdia = self.textdia + 1
                    if self.textdia == 6 || self.textdia == 9 ||
                        self.textdia == 26 ||
                        self.textdia == 30 ||
                        self.textdia == 33 ||
                        self.textdia == 34 ||
                        self.textdia == 46 ||
                        self.textdia == 51 ||
                        self.textdia == 64 ||
                        self.textdia == 70 ||
                        self.textdia == 71 ||
                        self.textdia == 83 ||
                        self.textdia == 86 ||
                    self.textdia == 97{
                        self.boyIndex = self.boyIndex + 1
                    }
                    if self.isBelieve == true && self.textdia == 49{
                        self.textdia = self.textdia + 1
                    }
                    else if self.isBelieve == false && self.textdia == 50{
                        self.textdia = self.textdia + 1
                        self.boyIndex = self.boyIndex + 1
                    }
                    if self.isBelieve == false && self.textdia == 53{
                        self.textdia = self.textdia + 2
                    }
                    if self.isBelieve == true && self.textdia == 55{
                        self.textdia = self.textdia + 1
                    }
                    if self.textdia > 97{
                        self.textdia = self.textdia - 1
                    }
                    if self.textdia == self.TiaName[self.NameIndex] + 1 && (self.TiaName[self.NameIndex] + 1) < 95 {
                        self.NameIndex = self.NameIndex + 1
                        
                    }

                }
                
                ) {
                    if self.textdia < 97{
                Image("nextbutton").renderingMode(.original).resizable().scaledToFit().frame(width:100)
                    }
                    else{
                        Image("nextbutton").renderingMode(.original).resizable().scaledToFit().frame(width:100).hidden()
                    }
                    
                }
            }
            if textdia > 63 && textdia < 68{
                Image("2019-10-5_ 16-25-43").resizable().scaledToFit().frame(width:400).offset(y:-230)//.position(x: 720, y: 930)
                
            }
            else if textdia == 68 || textdia == 69 {
                Image("2019-10-5_ 16-30-14").resizable().scaledToFit().frame(width:400).offset(y:-230)//.position(x: 720, y: 930)
                
            }
            else{
                Image("2019-10-5_ 16-25-43").resizable().scaledToFit().frame(width:400).offset(y:-230).hidden()
                Image("2019-10-5_ 16-30-14").resizable().scaledToFit().frame(width:400).offset(y:-230).hidden()
            }
            //Text("\(textdia)")
            //Text("\(TiaName[NameIndex])").offset(x:-15)
            if textdia == TiaName[NameIndex] || textdia == 49 || textdia == 50 || textdia == 53 || textdia == 54 || textdia == 55{
                Text(content).foregroundColor(Color("TiaColor")).offset(y:-85)
                //NameIndex = NameIndex + 1
            }
            
        }.edgesIgnoringSafeArea(.all)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(content: "Tia")
    }
}

