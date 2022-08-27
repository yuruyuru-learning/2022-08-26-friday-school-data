//
//  JikannViewController.swift
//  swiftPMApp
//
//  Created by Rikuminamisawa on 2022/05/03.
//

import UIKit

class JikannViewController: UIViewController {
    
    let dateFormatter = DateFormatter()
    var time: Float = 100
    var startTime: TimeInterval? = nil
    var timer = Timer()
    var jikann = Date()
    var timeArrey = [0,0,0,0]
    var date = Date()
    var voker = Date()
    var kate = Date()
    let cal = Calendar(identifier: .gregorian)
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var timerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(UserDefaults.standard.object(forKey: "today"))
//        if UserDefaults.standard.object(forKey: "today") == nil {
//
//        } else {
//            date = UserDefaults.standard.object(forKey: "today") as! Date
//            print(date)
//        }
//        dateFormatter.locale = Locale(identifier: "jp_JP")
//        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.object(forKey: "today") == nil {
            
        } else {
            date = UserDefaults.standard.object(forKey: "today") as! Date
            print(date)
        }
        dateFormatter.locale = Locale(identifier: "jp_JP")
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
        
        if UserDefaults.standard.object(forKey: "pickdate") == nil {
            return
        }
        let pickDate = UserDefaults.standard.object(forKey: "pickdate") as! Date
        
        datePicker.date = pickDate
        
        let nowDate = Date()
        let elapsedDays = Calendar.current.dateComponents([.day], from: nowDate, to: pickDate).day!
        let funn_h = Calendar.current.dateComponents([.hour], from: nowDate, to: pickDate).hour!
        let funn_m = Calendar.current.dateComponents([.minute], from: nowDate, to: pickDate ).minute!
        let funn_s = Int(Calendar.current.dateComponents([.second], from: nowDate, to: pickDate ).second!)
        
        timeArrey[0] = elapsedDays
        timeArrey[1] = Int(exactly: funn_h)!
        timeArrey[2] = Int(funn_m)
        timeArrey[3] = Int(funn_s % 60)
        
        timer.invalidate()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.down), userInfo: nil, repeats: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func startButton(_ sender: Any) {
        
        print(Calendar.current.timeZone)
        
        
        let nowDate = Date()
        let pickDate = datePicker.date
        let d = Calendar.current.component(.day, from: nowDate)
        let h = Calendar.current.component(.hour, from: nowDate)
        let m = Calendar.current.component(.minute, from: nowDate)
        let s = Calendar.current.component(.second, from: nowDate)
        
        var modifiedDate = Calendar.current.date(byAdding: .day, value: -d, to: pickDate)!
        modifiedDate = Calendar.current.date(byAdding: .hour, value: -h, to: modifiedDate)!
        modifiedDate = Calendar.current.date(byAdding: .minute, value: -m, to: modifiedDate)!
        modifiedDate = Calendar.current.date(byAdding: .second, value: -s, to: modifiedDate)!
        
        print(modifiedDate)
        
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = "HH"
        let date = formatter.string(from: modifiedDate)
        let elapsedDays = Calendar.current.dateComponents([.day], from: nowDate, to: pickDate).day!
        let funn_m = Calendar.current.dateComponents([.minute], from: nowDate, to: pickDate ).minute!
        let funn_s = Int(Calendar.current.dateComponents([.second], from: nowDate, to: pickDate ).second!)
        
        UserDefaults.standard.set(pickDate, forKey: "pickdate")
        
        
        //vvvvvvvvvv 第17回追加分
        timerLabel.text = String(elapsedDays) + "日" + date + "時間" + String(funn_m) + "分" + String(funn_s % 60) + "秒"
        timeArrey[0] = elapsedDays
        timeArrey[1] = Int(date)!
        timeArrey[2] = Int(funn_m)
        timeArrey[3] = Int(funn_s % 60)
        //^^^^^^^^^^ 第17回追加分
        
        print("elapsedDays")
        print(elapsedDays)
        print(funn_m)
        print(funn_s)
        print(date)
        print(nowDate)
        print(pickDate)
        print("合計")
        
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.down), userInfo: nil, repeats: true)
            print(timer.isValid)
        }
    }
    
    @objc func down() {
        
        
        if (timeArrey[0] == 0 && timeArrey[1] == 0 && timeArrey[2] == 0 && timeArrey[3] == 0) {
            timerLabel.text = "終了"
            timer.invalidate()
            print("test")
        } else {
            if timeArrey[3] > 0 {
                //秒数が0以上の時秒数を-1
                timeArrey[3] -= 1
            } else {
                //秒数が0の時
                timeArrey[3] += 59
                if timeArrey[2] > 0 {
                    //分が0以上の時、分を-1
                    timeArrey[2] -= 1
                } else {
                    //分が０の時、+59分、時間-1
                    timeArrey[2] += 59
                    if timeArrey[1] > 0 {
                        timeArrey[1] -= 1
                    } else {
                        timeArrey[1] += 59
                        timeArrey[0] -= 1
                    }
                    
                }
            }
            
            //vvvvvvvvvv 第17回追加分
            timerLabel.text = String(timeArrey[0]) + "日" + String(timeArrey[1]) + "時間" + String(timeArrey[2]) + "分" + String(timeArrey[3]) + "秒"
            print( String(timeArrey[0]) + "日" + String(timeArrey[1]) + String(timeArrey[2]) + "分" + String(timeArrey[3]) + "秒")
            //^^^^^^^^^^ 第17回追加分
        }
    }
}

