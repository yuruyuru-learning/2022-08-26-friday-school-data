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
    
    //var hogeImage: UIImage = UIImage(named: "hogeImage.jpg")!

    let imagePicker = UIImagePickerController()
    @IBOutlet var airlinecompanytextfiled: UITextField!
    @IBOutlet var modeltextfiled: UITextField!
    @IBOutlet var locationtextfiled: UITextField!
    @IBOutlet var shotingdatetextfiled: UITextField!
    @IBOutlet var aircraftnumbertextfiled: UITextField!
    var saveData: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //hogeImage = saveData.image(forKey: "hogeImage.jpg")
        //airplaneImage.image = hogeImage
        modeltextfiled.delegate = self
        locationtextfiled.delegate = self
        shotingdatetextfiled.delegate = self
        aircraftnumbertextfiled.delegate = self
        
        // Do any additional setup after loading the view.
//        saveData.set(airlinecompanytextfiled.text, forKey: "airlinecompany")
//        saveData.set(modeltextfiled.text, forKey: "model")
//        saveData.set(locationtextfiled.text, forKey: "location")
//        saveData.set(shotingdatetextfiled.text, forKey: "shotingdate")
//        saveData.set(aircraftnumbertextfiled.text, forKey: "aircraftnumber")
       
//    @IBAction func uploadbutton(){
//        airlinecompanytextfiled.text = saveData.object(forKey: "airlinecompany") as? String
//        modeltextfiled.text = saveData.object(forKey: "model") as? String
//        locationtextfiled.text = saveData.object(forKey: "location") as? String
//        shotingdatetextfiled.text = saveData.object(forKey: "shotingdate") as? String
//        aircraftnumbertextfiled.text = saveData.object(forKey: "aircraftnumber") as? String

        //imagePicker.allowsEditing = true
        //imagePicker.sourceType = .photoLibrary//後で変える
        //present(imagePicker,animated: true, completion: nil)
        //upload()
      }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        airlinecompanytextfiled.resignFirstResponder()
        return true
    }
   // fileprivate func upload(){
     //   let date = NSDate()
    //    let currtTimeStampInsecond = UInt64 (floor(date.timeIntervalSince1970* 1000))
     //   let storrageRef = //Storage.Storage().reference().child("images").("\(currentTimeStampInSecond).jpg")
       // let metaData
    
    
    
    
    @IBAction func savebutton(){
//        //saveData.setUIImageToData(image: hogeImage, forKey: "hikoukiImage")
//        saveData.set(airlinecompanytextfiled.text, forKey: "airlinecompany")
//        saveData.set(modeltextfiled.text, forKey: "model")
//        saveData.set(locationtextfiled.text, forKey: "location")
//        saveData.set(shotingdatetextfiled.text, forKey: "shotingdate")
//        saveData.set(aircraftnumbertextfiled.text, forKey: "aircraftnumber")
//
//        print(saveData.object(forKey: "airlinecompany"))
//        print(saveData.object(forKey: "model"))
//        print(saveData.object(forKey: "location"))
//        print(saveData.object(forKey: "aircraftnumber"))
//        print(saveData.object(forKey: "shotingdate"))
        
        SaveManager.save(airlinecompany: airlinecompanytextfiled.text!, model: modeltextfiled.text!, location: locationtextfiled.text!, aircraftnumber: aircraftnumbertextfiled.text!, shotingdate: shotingdatetextfiled.text!)
        
    }
    
    

//extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//            if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
//                airplaneImage.contentMode = .scaleAspectFit
//                airplaneImage.image = pickedImage
//            }
//        dismiss(animated: true, completion: nil)
//        }
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        dismiss(animated: true, completion: nil)
//
//    }
    
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

