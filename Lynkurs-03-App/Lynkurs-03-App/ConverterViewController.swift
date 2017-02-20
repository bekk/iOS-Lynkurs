//
//  ConverterViewController.swift
//  Lynkurs-03-App
//
//  Created by Fredrik Lillejordet on 15.02.2017.
//  Copyright © 2017 Bekk Consulting AS. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {

    @IBOutlet weak var fahrenheit: UITextField!
    @IBOutlet weak var celsius: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Converter"

        fahrenheit.addTarget(self, action: #selector(textFieldValueChanged(_:)), for: .editingChanged)
        celsius.addTarget(self, action: #selector(textFieldValueChanged(_:)), for: .editingChanged)
    }

    func textFieldValueChanged(_ textField: UITextField) {

        if textField == fahrenheit {
            if let value: Double = Double(fahrenheit.text!) {
                let converted = round((value - 32) / 1.8)
                celsius.text = "\(converted)"
            }
        } else {
            if let value: Double = Double(celsius.text!) {
                let converted = round(value * 1.8 + 32)
                fahrenheit.text = "\(converted)"
            }
        }
    }
}
