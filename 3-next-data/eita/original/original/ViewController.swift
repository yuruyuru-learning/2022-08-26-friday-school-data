//
//  ViewController.swift
//  original
//
//  Created by 渡辺瑛太 on 2022/07/08..obj
//

import UIKit
class ViewController: UIViewController, UITextFieldDelegate{
    @IBOutlet var airlinecompanylabel: UILabel!
    @IBOutlet var modellabel: UILabel!
    @IBOutlet var locationlabel: UILabel!
    @IBOutlet var shootingdate: UILabel!
    @IBOutlet var aircraftnumber: UILabel!
    @IBOutlet var airplaneImage: UIImageView!
    
    let imagePicker = UIImagePickerController()
    @IBOutlet var airlinecompanytextfiled: UITextField!
    @IBOutlet var modeltextfiled: UITextField!
    @IBOutlet var locationtextfiled: UITextField!
    @IBOutlet var shotingdatetextfiled: UITextField!
    @IBOutlet var aircraftnumbertextfiled: UITextField!
    var saveData: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modeltextfiled.delegate = self
        locationtextfiled.delegate = self
        shotingdatetextfiled.delegate = self
        aircraftnumbertextfiled.delegate = self
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        airlinecompanytextfiled.resignFirstResponder()
        return true
    }
    
    
    @IBAction func savebutton(){
        SaveManager.save(airlinecompany: airlinecompanytextfiled.text!, model: modeltextfiled.text!, location: locationtextfiled.text!, aircraftnumber: aircraftnumbertextfiled.text!, shotingdate: shotingdatetextfiled.text!)
        self.dismiss(animated: true, completion: nil)//EDIT
    }
}

extension UserDefaults {
    // 保存したいUIImage, 保存するUserDefaults, Keyを取得
    func setUIImageToData(image: UIImage, forKey: String) {
        // UIImageをData型へ変換
        let nsdata = image.pngData()
        // UserDefaultsへ保存
        self.set(nsdata, forKey: forKey)
    }
    // 参照するUserDefaults, Keyを取得, UIImageを返す
    func image(forKey: String) -> UIImage {
        // UserDefaultsからKeyを基にData型を参照
        let data = self.data(forKey: forKey)
        // UIImage型へ変換
        let returnImage = UIImage(data: data!)
        // UIImageを返す
        return returnImage!
    }
}

