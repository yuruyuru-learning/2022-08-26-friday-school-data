//
//  SaveManager.swift
//  original
//
//  Created by 渡辺瑛太 on 2022/08/26.
//

import Foundation
class SaveManager{
    
    public static func save(airlinecompany:String,model:String,location:String,aircraftnumber:String,shotingdate:String){
        let saveData = UserDefaults.standard
        
        var airplanecompanyArray=readairlinecompany()
        airplanecompanyArray.append(airlinecompany)
        saveData.set(airplanecompanyArray, forKey: "airlinecompany")
        
        var modelArray=readmodel()
        modelArray.append(model)
        saveData.set(modelArray, forKey: "model")
        
        var locationArray=readlocation()
        locationArray.append(location)
        saveData.set(locationArray, forKey: "location")
        
        var shotdateArray=readshotdate()
        shotdateArray.append(shotingdate)
        saveData.set(shotingdate, forKey: "shotingdate")
        
        var aircraftnumberArray=readaircraftnumber()
        aircraftnumberArray.append(aircraftnumber)
        saveData.set(aircraftnumberArray, forKey: "aircraftnumber")
        
//        saveData.set(model, forKey: "model")
//        saveData.set(location, forKey: "location")
//        saveData.set(shotingdate, forKey: "shotingdate")
//        saveData.set(aircraftnumber, forKey: "aircraftnumber")
    }
    public static func readairlinecompany()->[String]{
        let saveData = UserDefaults.standard
        let object = saveData.object(forKey:"airlinecompany")as![String]
        return object
    }
    public static func readmodel()->[String]{
        let saveData = UserDefaults.standard
        let object = saveData.object(forKey:"model")as![String]
        return object
    }
    public static func readlocation()->[String]{
        let saveData = UserDefaults.standard
        let object = saveData.object(forKey:"location")as![String]
        return object
    }
    public static func readshotdate()->[String]{
        let saveData = UserDefaults.standard
        let object = saveData.object(forKey:"shotingdate")as![String]
        return object
    }
    public static func readaircraftnumber()->[String]{
        let saveData = UserDefaults.standard
        let object = saveData.object(forKey:"aircraftnumber")as![String]
        return object
    }
    
}
