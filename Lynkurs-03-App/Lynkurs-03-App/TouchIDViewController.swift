//
//  TouchIDViewController.swift
//  Lynkurs-03-App
//
//  Created by Fredrik Lillejordet on 21/02/2017.
//  Copyright © 2017 Bekk Consulting AS. All rights reserved.
//

//Ref https://github.com/jgonfer/thumba-touch-id-tutorial-swift

import UIKit
import LocalAuthentication

class TouchIDViewController : UIViewController {
    
    @IBOutlet weak var message: UILabel!
    
    var context = LAContext()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAuthenticationPolicy()
    }
    
    func setupAuthenticationPolicy() {
        let policy: LAPolicy = .deviceOwnerAuthentication
        
        var error: NSError?
        guard context.canEvaluatePolicy(policy, error: &error) else {
            print("Error: canEvaluatePolicy \(error)")
            return
        }
        
        login(policy: policy)
    }
    
    func login(policy: LAPolicy) {
        context.evaluatePolicy(policy, localizedReason: "Need for demo", reply: { (success, error) in
            
            guard success else {
            // Not success
                
                guard let error = error else {
                    print("Error: evaluatePolicy failed without error")
                    return
                }
                
                switch(error) {
                case LAError.touchIDLockout:
                    self.message.text = "There were too many failed Touch ID attempts and Touch ID is now locked."
                case LAError.appCancel:
                    self.message.text = "Authentication was canceled by application."
                case LAError.invalidContext:
                    self.message.text = "LAContext passed to this call has been previously invalidated."
                default:
                    self.message.text = "Touch ID may not be configured"
                    break
                }
                return
            }
            
            // Success
            DispatchQueue.main.async {
                self.message.text = "Successfully logged in! 👍"
            }
        })
    }
}
