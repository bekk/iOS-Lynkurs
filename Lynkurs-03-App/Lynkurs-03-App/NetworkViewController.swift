//
//  NetworkViewController.swift
//  Lynkurs-03-App
//
//  Created by Fredrik Lillejordet on 15.02.2017.
//  Copyright © 2017 Bekk Consulting AS. All rights reserved.
//

import UIKit

class NetworkViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var textBox: UITextView!

    @IBAction func getButton(_ sender: Any) {
        if let number = Int(input.text!) {
            getPersonFromSwapi(personNumber: number)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Network"
        getPersonFromSwapi(personNumber: 1)
    }

    func getPersonFromSwapi(personNumber: Int) {

        let urlString = "https://swapi.co/api/people/\(personNumber)/?format=json"
        let request = URLRequest(url: URL(string: urlString)!)
        let session = URLSession.shared

        let task = session.dataTask(with: request, completionHandler: { (data, response, error) in

            guard error == nil else {
                print("\(error)")
                return
            }

            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }

            self.parseResponse(responseData: responseData)
        })

        task.resume()
    }

    func parseResponse(responseData: Data) {

        do {
            guard let person = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: AnyObject] else {
                print("Error: Serialization failed")
                return
            }

            updateView(person: person)

        } catch {
            print("Error: catched unknown error")
            return
        }
    }

    func updateView(person: [String: AnyObject]) {

        DispatchQueue.main.async {
            self.textBox.text = "\(person)"
            if let personName = person["name"] as? String {
                self.name.text = personName
            }
        }
    }
}
