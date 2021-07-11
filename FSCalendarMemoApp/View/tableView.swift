//
//  tableView.swift
//  FSCalendarMemoApp
//
//  Created by UrataHiroki on 2021/07/11.
//

import Foundation
import UIKit

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 137
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.realmCRUDModel.readRealmArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let cellEventLabel = cell.contentView.viewWithTag(1) as! UILabel
        let cellPlaceLabel = cell.contentView.viewWithTag(2) as! UILabel
        let cellWhoLabel = cell.contentView.viewWithTag(3) as! UILabel
        
        cellEventLabel.text = self.realmCRUDModel.readRealmArray[indexPath.row]["RealmEvent"]
        cellPlaceLabel.text = self.realmCRUDModel.readRealmArray[indexPath.row]["RealmPlace"]
        cellWhoLabel.text = self.realmCRUDModel.readRealmArray[indexPath.row]["RealmWho"]
        return cell
        
    }
    
    
    
    
}
