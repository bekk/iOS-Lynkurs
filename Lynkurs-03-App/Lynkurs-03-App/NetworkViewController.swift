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
    
    @IBAction func getButton(_ sender: Any) {
        if let number = Int(input.text!) {
            get(urlString: "https://swapi.co/api/people/\(number)/?format=json")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Network"
    }
    
    func get(urlString: String){
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
                print("Serialization failed")
                return
            }
            updateView(person: person)
            
        } catch {
            print("catch error")
            return
        }
    }
    
    func updateView(person: [String: AnyObject]) {
        DispatchQueue.main.async {
            if let personName = person["name"] as? String{
                self.name.text = personName
            }
        }
    }
}
