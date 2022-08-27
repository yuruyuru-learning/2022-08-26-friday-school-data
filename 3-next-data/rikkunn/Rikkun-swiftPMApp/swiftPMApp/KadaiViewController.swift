//
//  KadaiViewController.swift
//  swiftPMApp
//
//  Created by Rikuminamisawa on 2021/12/10.
//

import UIKit

class KadaiViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var kadaiTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    let saveData = UserDefaults.standard
    var dataArray: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        kadaiTextField.delegate = self
        dataArray = saveData.object(forKey: "kadai") as? [String] ?? [String]()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func save(_ sender: Any) {
        let kadai = kadaiTextField.text!
        dataArray.append(kadai)
        saveData.set(dataArray, forKey: "kadai")
        
        let alert = UIAlertController(title: "保存", message: "点数の保存が完了しました", preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(title: "OK",
                          style: .default,
                          handler: {action in
                              self.tableView.reloadData()
                              self.kadaiTextField.text = ""
                          }
                         )
        )
        
        present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = dataArray[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            switch editingStyle {
            case .delete:
                dataArray.remove(at: indexPath.row)
                saveData.set(dataArray, forKey: "kadai")
                tableView.beginUpdates()
                tableView.deleteRows(at: [indexPath], with: .automatic)
                tableView.endUpdates()
            default:
                break
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
