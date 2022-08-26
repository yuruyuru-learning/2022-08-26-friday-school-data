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
    
    var airplanecompanyArray: [String] = []
    var modelArray: [String] = []
    var locationArray: [String] = []
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        airplanecompanyArray = SaveManager.readairlinecompany()
        
        // Do any additional setup after loading the view.
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
