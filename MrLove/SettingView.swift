//
//  SettingView.swift
//  MrLove
//
//  Created by User18 on 2019/12/7.
//  Copyright © 2019 User23. All rights reserved.
//

import SwiftUI

struct SettingView: View {
    var content : String
    @State private var fontnumber: CGFloat = 20
    @State private var name = ""
    //var fontArr = ["body","Title"]
    var body: some View {
        ZStack(alignment: .topLeading){
            Image("個人頁面").resizable().scaledToFill().frame(minWidth: 0, maxWidth: .infinity)
            VStack(alignment: .leading,spacing: 10){
                HStack(alignment: .bottom,spacing: 15){
                    Text("模擬樣式").padding()
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.blue, lineWidth: 5)).offset(x:10)
                    Image("tia頭像").renderingMode(.original).resizable().scaledToFit().frame(width:250).offset(x:5).overlay(Text(name).scaledFont(name: "", size: fontnumber).foregroundColor(Color("TiaColor")).font(.title).offset(x:-70,y:105))
                }
                HStack(spacing: 20){
                Text("更改名字").padding()
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.blue, lineWidth: 5)).offset(x:10)
                TextField(content, text: $name, onEditingChanged: { (editing) in
                    print("onEditingChanged", editing)
                }) {
                   print(self.name)
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
            }
                HStack(spacing: 20){
                    Text("字體大小").padding()
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.blue, lineWidth: 5)).offset(x:10)
                    Slider(value: $fontnumber, in: 20...30, step: 1) {
                   Text("")
                }
                    Text("\(fontnumber, specifier: "%.f")")
                }
            }
            
        }
    }
}

struct ScaledFont: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory
    var name: String
    var size: CGFloat

    func body(content: Content) -> some View {
       let scaledSize = UIFontMetrics.default.scaledValue(for: size)
        return content.font(.custom(name, size: scaledSize))
    }
}

extension View {
    func scaledFont(name: String, size: CGFloat) -> some View {
        return self.modifier(ScaledFont(name: name, size: size))
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(content: "")
    }
}
