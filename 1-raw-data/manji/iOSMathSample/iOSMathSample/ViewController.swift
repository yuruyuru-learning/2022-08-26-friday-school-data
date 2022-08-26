//
//  ViewController.swift
//  iOSMathSample
//
//  Created by Masashi Hamaguchi on 2022/07/23.
//

import UIKit
import iosMath

protocol ViewControllerDelegate {
    func loadDataSource()
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ViewControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    //辞書方の宣言(先週やった！)
    var formulaList: Array<Dictionary<String, String>> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // for TableView
        tableView.dataSource = self
        tableView.delegate = self
        
        // CustomCellを設定
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        
        // 保存してあるデータを読み取る
        loadDataSource()
    }
    
    func loadDataSource() {
        formulaList = UserDefaults.standard.object(forKey: "formula") as? Array<Dictionary<String, String>> ?? []
        tableView.reloadData()
    }
    
    @IBAction func onClick(_ sender: UIButton) {
        // AddViewに画面遷移
        let addView = storyboard?.instantiateViewController(withIdentifier: "AddView") as! AddViewController
        addView.callback = { self.loadDataSource() }
        present(addView, animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return formulaList.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        
        //セルの中のラベルに表示させる
        cell.KosikiLabel.text = formulaList[indexPath.row]["title"]
        cell.Mathlabel.latex = formulaList[indexPath.row]["formula"]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            formulaList.remove(at: indexPath .row)
            tableView .reloadData()
        }
    }
    
}

