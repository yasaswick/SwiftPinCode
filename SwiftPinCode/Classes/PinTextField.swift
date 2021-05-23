//
//  PinTextField.swift
//  SwiftPinCode
//
//  Created by Yasas on 2021-05-23.
//

import SwiftUI


struct PinTextField: UIViewRepresentable {
    @Binding var text: String

    func makeCoordinator() -> Coordinator {
        Coordinator(text: $text)
    }

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.placeholder = ""
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        textField.keyboardType = .numberPad
        textField.tintColor = .white
        textField.textColor = .white
        textField.delegate = context.coordinator
        return textField
    }

    func updateUIView(_ view: UITextField, context: Context) {
        view.text = text
    }
}

extension PinTextField {
    class Coordinator: NSObject, UITextFieldDelegate {
        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            DispatchQueue.main.async {
                self.text = textField.text ?? ""
            }
        }
    }
}

