//
//  PassCodeVM.swift
//  ScrapApp (iOS)
//
//  Created by Yasas on 5/22/21.
//

import Foundation

class SwiftPinCodeVM : ObservableObject {
    let characterLimit: Int
    @Published var isFinished = false
    @Published var textArray: [Character] = []
    @Published var text: String = "" {
        didSet {
            if text.count > characterLimit && oldValue.count <= characterLimit {
                text = oldValue
            }
            if text.count == characterLimit && isFinished == false {
                isFinished = true
                print("Completed")
            }
            if text.count < characterLimit && isFinished == true {
                isFinished = false
            }
            
            textArray = Array(text)
            if characterLimit > textArray.count {
                let buff = [Character](repeating: " ", count: characterLimit - textArray.count)
                textArray.append(contentsOf: buff)
               
            }
        }
    }

    init(limit: Int = 5){
        characterLimit = limit
        textArray = [Character](repeating: " ", count: limit)
       
    }
}
