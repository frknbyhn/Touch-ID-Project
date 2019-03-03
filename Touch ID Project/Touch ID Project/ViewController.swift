//
//  ViewController.swift
//  Touch ID Project
//
//  Created by Furkan Beyhan on 27.02.2019.
//  Copyright © 2019 Furkan Beyhan. All rights reserved.
//


import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let authContext = LAContext()
        
        self.statusLabel.text = "hello moto"
        var error : NSError?
        
        
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error){
            
            authContext.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: "Gerçekten siz misiniz?") { (success, error) in
                if success == true {
                    DispatchQueue.main.async {
                        self.statusLabel.text = "Success!"
                    }
                } else {
                    
                    DispatchQueue.main.async {
                        self.statusLabel.text = "Failure!"
                    }
                }
            }
            
        }
        
        
        
        
    }
    
    
}




