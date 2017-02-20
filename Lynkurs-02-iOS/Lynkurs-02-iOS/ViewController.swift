//
//  ViewController.swift
//  Lynkurs-02-iOS
//
//  Created by Oscar Eckbo on 15/02/2017.
//  Copyright © 2017 Bekk Consulting AS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var input: UITextField!

    @IBAction func inputChanged(_ sender: UITextField) {
        oppdaterLabel(inputText: sender.text!)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func oppdaterLabel(inputText: String) {
        label.text = inputText
    }
}
