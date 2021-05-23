//
//  SwiftPinCode.swift
//  SwiftPinCode
//
//  Created by Yasas on 2021-05-23.
//

import SwiftUI


 struct SwiftPinCodeField: View {
    
    @ObservedObject var controller : SwiftPinCodeVM
    
    var body: some View {
        VStack(alignment: .center ){
            ZStack {
                PinTextField(text:$controller.text).padding()
                CodeView(code: $controller.textArray).padding()
            }
        }.frame(height: 50)
    }
}

struct CodeView : View {
    @Binding var code : [Character]
    var body: some View {
            HStack{
                ForEach(code , id: \.self) { i in
                    PassCodeView(value: String(i))
                }
            }
    }
}

struct PassCodeView : View {
    var value : String
    var body : some View {
        VStack{
            Text(value)
                .foregroundColor(.black).padding()
            Rectangle()
                .fill(Color(.gray))
                   .frame(height:1)
                  
        }
    }
    
}
