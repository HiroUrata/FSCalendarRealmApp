//
//  Alert.swift
//  FSCalendarMemoApp
//
//  Created by UrataHiroki on 2021/07/11.
//

import Foundation
import UIKit


extension ViewController{
    
    func createTextFieldAlert(calendarDay:String){

       var eventTextField:UITextField?
       var placeTextField:UITextField?
       var whoTextField:UITextField?
        
       let alert = UIAlertController(title: "変更確認アラート", message:"変更する場合は、値を入力して下さい", preferredStyle: .alert)

       alert.addTextField { (alertEventTextField:UITextField) in

        alertEventTextField.placeholder = "イベントなど"
            eventTextField = alertEventTextField

       }

       alert.addTextField { (alertPlaceTextField:UITextField) in

        alertPlaceTextField.placeholder = "どこで"
             placeTextField = alertPlaceTextField

       }
        
        alert.addTextField { (alertWhoTextField:UITextField) in
            
            alertWhoTextField.placeholder = "誰と"
            whoTextField = alertWhoTextField
            
        }

       alert.addAction(UIAlertAction(title: "キャンセル", style: .default, handler: nil))
       
       alert.addAction(UIAlertAction(title: "追加", style: .default, handler: { _ in

        self.realmCRUDModel.createRealm(createDay: calendarDay, createEvent: (eventTextField?.text)!, createPlace: (placeTextField?.text)!, createWho: (whoTextField?.text)!)
           
        self.realmCRUDModel.filterReadRealm(calendarDay: calendarDay)
        self.tableView.reloadData()

        }))

        present(alert, animated: true, completion: nil)

   }
    
}

