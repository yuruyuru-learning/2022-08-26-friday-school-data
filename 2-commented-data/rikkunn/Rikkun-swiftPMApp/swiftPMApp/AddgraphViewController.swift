//
//  AddgraphViewController.swift
//  swiftPMApp
//
//  Created by Rikuminamisawa on 2021/12/10.
//

import UIKit

class AddgraphViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet var scoreTextField: UITextField!

    var saveData: UserDefaults = UserDefaults.standard
    var dataArray: [Double]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        titleTextField.text = saveData.
        // Do any additional setup after loading the view.
        scoreTextField.delegate = self
        dataArray = saveData.object(forKey: "score") as? [Double] ?? [Double]()
    }
    
    @IBAction func saveMemo() {
        
        let scoreText = scoreTextField.text!
        let score = Double(scoreText)!
        dataArray.append(score)
        saveData.set(dataArray, forKey: "score")
        
        let alert = UIAlertController(title: "保存", message: "点数の保存が完了しました", preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(title: "OK",
                          style: .default,
                          handler: {action in
                              let count = (self.navigationController?.viewControllers.count)! - 2
                              let vc = self.navigationController?.viewControllers[count]
                              vc?.loadView()
                              vc?.viewDidLoad()
                              self.navigationController?.popViewController(animated: true)
                          }
                         )
        )
        
        present(alert, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        scoreTextField.resignFirstResponder()
        return true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
