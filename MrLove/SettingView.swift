//
//  SettingView.swift
//  MrLove
//
//  Created by User18 on 2019/12/7.
//  Copyright © 2019 User23. All rights reserved.
//

import SwiftUI

struct SettingView: View {
    @Binding var content : String
    @Binding var fontnumber: CGFloat
    var roles = ["步道", "別墅", "響尾蛇酒吧"]
    @Binding var selectBackGround: Int 
    //@State private var fontWeught: UIFont.Weight
    var body: some View {
        ZStack(alignment: .topLeading){
            Image(roles[selectBackGround]).resizable().scaledToFill().frame(minWidth: 0, maxWidth: .infinity)
            VStack(alignment: .leading,spacing: 10){
                HStack(alignment: .bottom,spacing: 15){
                    Text("預覽樣式").padding().background(LinearGradient(gradient: Gradient(colors: [Color.init(red: 255/255, green: 217/255, blue: 218/255), Color.init(red: 204/255, green: 113/255, blue: 120/255)]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1))).cornerRadius(20)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 2)).offset(x:10)
                    Image("tia頭像").renderingMode(.original).resizable().scaledToFit().frame(width:250).offset(x:5).overlay(Text(content).scaledFont(name: "", size: fontnumber).foregroundColor(Color("TiaColor")).font(.title).offset(x:-70,y:105))
                }
                HStack(spacing: 20){
                    Text("更改名字").padding().background(LinearGradient(gradient: Gradient(colors: [Color.init(red: 255/255, green: 217/255, blue: 218/255), Color.init(red: 204/255, green: 113/255, blue: 120/255)]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1))).cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 2)).offset(x:10)
                    TextField(content, text: $content)
                        .textFieldStyle(RoundedBorderTextFieldStyle()).frame(width: UIScreen.main.bounds.width*2/3, height: 50)
                
            }
                fontsilder(fontnumber: $fontnumber)
                HStack(alignment:.top,spacing: 20){
                    Text("更改背景").padding().background(LinearGradient(gradient: Gradient(colors: [Color.init(red: 255/255, green: 217/255, blue: 218/255), Color.init(red: 204/255, green: 113/255, blue: 120/255)]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1))).cornerRadius(20)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 2)).offset(x:10)
                   Picker(selection: $selectBackGround, label: Text("選擇背景")) {

                   ForEach(0..<3) { (index) in
                    Text(self.roles[index])
                   }
                   }.frame(width: UIScreen.main.bounds.width*2/3, height: 50)
                   .background(LinearGradient(gradient: Gradient(colors: [Color.init(red: 255/255, green: 217/255, blue: 218/255), Color.init(red: 204/255, green: 113/255, blue: 120/255)]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
                   .foregroundColor(.white)
                   .cornerRadius(10)
                   .shadow(radius: 30)
                    .clipped()
                }
            }
            
        }.edgesIgnoringSafeArea(.all)
         
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
        SettingView(content: .constant("Tia"),fontnumber: .constant(26),selectBackGround: .constant(0))
    }
}



struct fontsilder: View {
    @Binding var fontnumber: CGFloat
    var body: some View {
        HStack(spacing: 20){
            Text("字體大小").padding().background(LinearGradient(gradient: Gradient(colors: [Color.init(red: 255/255, green: 217/255, blue: 218/255), Color.init(red: 204/255, green: 113/255, blue: 120/255)]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1))).cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 2)).offset(x:10)
            Slider(value: $fontnumber, in: 20...30, step: 1) {
                Text("")
            }.accentColor(Color(red: 204/255, green: 113/255, blue: 120/255)).frame(width: UIScreen.main.bounds.width*5/9)
            Text("\(fontnumber, specifier: "%.f")").font(.title).fontWeight(.semibold).scaledFont(name: "", size: 27).foregroundColor(Color("TiaColor"))
        }
    }
}
