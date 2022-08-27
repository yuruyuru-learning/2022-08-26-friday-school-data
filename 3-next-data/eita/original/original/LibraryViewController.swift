//
//  libraryViewController.swift
//  original
//
//  Created by 渡辺瑛太 on 2022/07/08.
//

import UIKit

class libraryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var collectionView: UICollectionView!//EDIT
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(airplanecompanyArray.count)
        return airplanecompanyArray.count//EDIT
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mycell", for: indexPath) as! MyCell//EDIT
        cell.label.text = airplanecompanyArray[indexPath.row] //EDIT
        return cell
    }
    
    var airplanecompanyArray: [String] = []
    var modelArray: [String] = []
    var locationArray: [String] = []
    var shotDataArray: [String] = []
    var airplaneNumberArray: [String] = []
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        collectionView.delegate = self//EDIT
        collectionView.dataSource = self//EDIT
        
        airplanecompanyArray = SaveManager.readairlinecompany()
        modelArray = SaveManager.readmodel()
        locationArray = SaveManager.readlocation()
        shotDataArray = SaveManager.readshotdate()
        airplanecompanyArray = SaveManager.readaircraftnumber()
        
        collectionView.reloadData()
    }
    
}
