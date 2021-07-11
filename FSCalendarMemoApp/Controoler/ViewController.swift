//
//  ViewController.swift
//  FSCalendarMemoApp
//
//  Created by UrataHiroki on 2021/07/11.
//

import UIKit
import FSCalendar

class ViewController: UIViewController {

    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var modeChangeButton: UIButton!
    
    
    let realmCRUDModel = RealmCRUDModel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        UserDefaults.standard.set("追加", forKey: "addORLook")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.modeChangeButton.layer.cornerRadius = 13.0
        
        self.careteCalendar()
        
    }

    @IBAction func modeChange(_ sender: Any) {
        
        if UserDefaults.standard.object(forKey: "addORLook") as! String == "追加" {
            
            //self.modeChangeButton.titleLabel?.text = "予定を追加可能にする"
            self.modeChangeButton.setTitle("予定を追加可能にする", for: .normal)
            UserDefaults.standard.set("見るだけ", forKey: "addORLook")
            print("見るだけにした")
            
        }else{
            
            //self.modeChangeButton.titleLabel?.text = "閲覧のみ状態にする"
            self.modeChangeButton.setTitle("閲覧のみ状態にする", for: .normal)
            UserDefaults.standard.set("追加", forKey: "addORLook")
            print("追加にした")
        }
        
    }
    
    
}

