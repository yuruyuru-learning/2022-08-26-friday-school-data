//
//  ViewController.swift
//  swiftPMApp
//
//  Created by Rikuminamisawa on 2021/12/10.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var button: UIButton!
    @IBOutlet var BOtton: UIButton!
    
    @IBOutlet weak var purposeTextField: UITextField!
    var saveData: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
      button.layer.cornerRadius = 10
      BOtton.layer.cornerRadius = 10

        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        purposeTextField.delegate = self
        purposeTextField.text = saveData.object(forKey: "purpose") as! String?
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let text = purposeTextField.text!
        saveData.set(text, forKey: "purpose")
        
        purposeTextField.resignFirstResponder()
        return true
    }


}

