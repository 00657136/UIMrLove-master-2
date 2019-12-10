//
//  PhoneCallView.swift
//  MrLove
//
//  Created by User20 on 2019/10/25.
//  Copyright © 2019 User23. All rights reserved.
//

import SwiftUI

struct PhoneCallView: View {
    var body: some View {
        ZStack(alignment: .center){
        //Image("黑幕").resizable().scaledToFill().frame(minWidth: 0, maxWidth: .infinity)
            
            
            Image("2019-10-6_ 13-19-42").resizable().scaledToFill().frame(minWidth: 0, maxWidth: .infinity)
            Image("eunwoo來電").resizable().scaledToFill().frame(minWidth: 0, maxWidth: .infinity)
            VStack{
                //Image("劇情").resizable().scaledToFit().frame(width:360).hidden()
                HStack{
                      Image("tia頭框").resizable().scaledToFill().frame(width:100,height: 100).cornerRadius(100)
                    Image("劇情").resizable().scaledToFit().frame(width:250).hidden()
                }
                //Image("劇情").resizable().scaledToFit().frame(width:100).hidden()
                Image("hangup").resizable().scaledToFit().frame(width:70)
            }
        }.edgesIgnoringSafeArea(.all)
        
        
    }
}

struct PhoneCallView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneCallView()
    }
}
