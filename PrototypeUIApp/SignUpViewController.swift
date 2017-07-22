//
//  SignUpViewController.swift
//  GreatLookingLoginInterface
//
//  Created by Arkadijs Makarenko on 26/06/2017.
//  Copyright © 2017 ArchieApps. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernamTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }
    @IBAction func singUp(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }

    @IBAction func dismissPopUp(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
