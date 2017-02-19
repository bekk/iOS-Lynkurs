//
//  SettingsViewController.swift
//  Lynkurs-03-App
//
//  Created by Fredrik Lillejordet on 19.02.2017.
//  Copyright © 2017 Bekk Consulting AS. All rights reserved.
//

import UIKit

/*
 See https://developer.apple.com/reference/foundation/userdefaults
*/

class SettingsViewController: UIViewController {

    let SAVED_NUMBER = "savedNumber"

    @IBOutlet weak var bigNumber: UILabel!

    @IBOutlet weak var numberSlider: UISlider!

    @IBAction func numberSlider(_ sender: Any) {
        save(key: SAVED_NUMBER, value: Int(numberSlider.value))
        updateUI()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        updateUI()
    }

    func updateUI() {
        let value = get(key: SAVED_NUMBER)
        bigNumber.text = "\(value)"
        numberSlider.value = Float(value)
    }

    func get(key: String) -> Int {
        return UserDefaults.standard.integer(forKey: key)
    }

    func save(key: String, value: Int) {
        UserDefaults.standard.set(value, forKey: key)
    }
}
