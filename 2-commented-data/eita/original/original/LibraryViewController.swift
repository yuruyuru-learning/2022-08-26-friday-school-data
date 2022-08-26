//
//  libraryViewController.swift
//  original
//
//  Created by 渡辺瑛太 on 2022/07/08.
//

import UIKit

class libraryViewController: UIViewController,
                             UICollectionViewDelegate,
                             UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let label = cell.contentView.viewWithTag(1)as! UILabel
        label.text = String(indexPath.row + 1)
        
        return cell
    }
    
    //vvvvvvvvvv 第17回追加分
    var airplanecompanyArray: [String] = []
    var modelArray: [String] = []
    var locationArray: [String] = []
    var shotDataArray: [String] = []
    var airplaneNumberArray: [String] = []
    //^^^^^^^^^^ 第17回追加分
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        //vvvvvvvvvv 第17回追加分
        airplanecompanyArray = SaveManager.readairlinecompany()
        modelArray = SaveManager.readmodel()
        locationArray = SaveManager.readlocation()
        shotDataArray = SaveManager.readshotdate()
        airplanecompanyArray = SaveManager.readaircraftnumber()
        //^^^^^^^^^^ 第17回追加分
        
    }
}
