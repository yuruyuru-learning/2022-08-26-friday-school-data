//
//  JikannViewController.swift
//  swiftPMApp
//
//  Created by Rikuminamisawa on 2022/05/03.
//

import UIKit

class JikannViewController: UIViewController {
    
    // private let labelText = ["hours", "mins", "sec"]
    
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
    
    //    var timeInterval = Date()
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var timerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //userdefaultから数値の取り出し
        if UserDefaults.standard.object(forKey: "today") == nil {
            //何もしない
        } else {
            date = UserDefaults.standard.object(forKey: "today") as! Date
            
            print(date)
            print("test")
        }
        print(UserDefaults.standard.object(forKey: "today"))
        print("wow")
        
        // ロケール設定（端末の暦設定に引きづられないようにする）
        dateFormatter.locale = Locale(identifier: "jp_JP")
        
        // タイムゾーン設定（端末設定によらず固定にしたい場合）
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
        
        
        // print (Picker.date)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func startButton(_ sender: Any) {
        
        let nowDate = Date()
        let pickDate = datePicker.date
        let d = Calendar.current.component(.day, from: nowDate)
        let h = Calendar.current.component(.hour, from: nowDate)
        let m = Calendar.current.component(.minute, from: nowDate)
        let s = Calendar.current.component(.second, from: nowDate)
        print(d)
        print(h)
        print(m)
        print(s)
        var modifiedDate = Calendar.current.date(byAdding: .day, value: -d, to: pickDate)!
        modifiedDate = Calendar.current.date(byAdding: .hour, value: -h, to: modifiedDate)!
        modifiedDate = Calendar.current.date(byAdding: .minute, value: -m, to: modifiedDate)!
        modifiedDate = Calendar.current.date(byAdding: .second, value: -s, to: modifiedDate)!
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = "HH"
        let date = formatter.string(from: modifiedDate)
        let elapsedDays = Calendar.current.dateComponents([.day], from: nowDate, to: pickDate).day!
        let funn_m = Calendar.current.dateComponents([.minute], from: nowDate, to: pickDate ).minute!
        let funn_s = Int(Calendar.current.dateComponents([.second], from: nowDate, to: pickDate ).second!)
        
        
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
        
        
        
        //        let gou = elapsedDays * 24 * 60 * 60 + funn_s
        //        print(gou)
        //        let art = dateFormatter.string(from: Picker.date)
        //                  print(art)
        //           self.startTime = Date.timeIntervalSinceReferenceDate
        //
        //        let timeInterval = Date().timeIntervalSince(jikann)
        //                   let timees = Int(timeInterval)
        //            print(timeInterval)
        //
        //                   let d = timees / 86400
        //                   let h = timees / 3600 % 24
        //                   let m = timees / 60 % 60
        //                   let s = timees % 86400
        //        print(timees)
        //        print("日にちは\(d)")
        //        print("時間は\(h)")
        //        let pickDate = Picker.date
        //        print(pickDate)
        //        print(date)
        //        let d = Calendar.current.component(.day, from:date )
        //        let h = Calendar.current.component(.hour, from:date )
        //        let m = Calendar.current.component(.minute, from:date)
        //        let s = Calendar.current.component(.second, from: date)
        //        print(d)
        //        print(h)
        //        print(m)
        //        print(s)
        //        var modifiedDate = Calendar.current.date(byAdding: .day, value: d, to: pickDate)!
        //        modifiedDate = Calendar.current.date(byAdding: .hour, value: h, to: modifiedDate)!
        //        modifiedDate = Calendar.current.date(byAdding: .minute, value: m, to: modifiedDate)!
        //        modifiedDate = Calendar.current.date(byAdding: .second, value: s, to: modifiedDate)!
        //        let formatter: DateFormatter = DateFormatter()
        //        formatter.calendar = Calendar(identifier: .gregorian)
        //        formatter.dateFormat = "dd日hh時間mm分ss秒"
        //        let date = formatter.string(from: modifiedDate)
        //        print(date)
        //        let elapsedDays = Calendar.current.dateComponents([.day], from: jikann, to: pickDate).day!
        //        timeArrey[0] =
        //        timeArrey[1] =
        //        timeArrey[2] =
        //        timeArrey[3] =
        //                  // let ji = String(format: "%d日%d時間", d, h)
        //                   print(timeArrey)
        //                   timerLabel.text = String("\(timeArrey[0])日\(timeArrey[1])時間")
        
        
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.down), userInfo: nil, repeats: true)
            print(timer.isValid)
        }
        
        //        func timerCounter() {
        //           // guard let startTime = self.startTime else { return }
        ////            let time = Date.timeIntervalSinceReferenceDate - startTime
        ////            let min = Int(time / 60)
        ////            let sec = Int(time) % 60
        ////            let msec = Int((time - Double(sec)) * 100.0)
        ////            self.timerLabel.text = String(format: "%02d:%02d:%02d", min, sec, msec)
        //
        //        }
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

