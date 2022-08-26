//
//  AddViewController.swift
//  iOSMathSample
//
//  Created by Masashi Hamaguchi on 2022/07/23.
//

import UIKit
import iosMath

class AddViewController: UIViewController {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var formulaTextField: UITextField!
    @IBOutlet var mathLabel: MTMathUILabel!
    @IBOutlet var button: UIButton!
    
    var callback: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClick() {
        let title = titleTextField.text!
        let formula = formulaTextField.text!
        
        // title/formula どちらか空白の場合は保存しない
        if (title.isEmpty || formula.isEmpty) { return }
        
        // UserDefaultsから既存データを取得
        var formulaList = UserDefaults.standard.object(forKey: "formula") as? Array<Dictionary<String, String>> ?? []
        
        formulaList.append([
            "title": title,
            "formula": formula
        ])
        
        // UserDefaultsに保存
        UserDefaults.standard.set(formulaList, forKey: "formula")
        
        self.dismiss(animated: true, completion: { self.callback?() })
    }
    
    @IBAction func textFieldDidChange(_ textField: UITextField) {
        // formulaTextFieldが変更されたらLaTeXを表示する
        if let text = textField.text {
            mathLabel.latex = text
        }
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
