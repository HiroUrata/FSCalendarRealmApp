//
//  Calendar.swift
//  FSCalendarMemoApp
//
//  Created by UrataHiroki on 2021/07/11.
//

import Foundation
import FSCalendar
import UIKit

extension ViewController:FSCalendarDelegate,FSCalendarDataSource,FSCalendarDelegateAppearance{
    
 
    func careteCalendar(){
 
        let calendar = FSCalendar(frame: CGRect(x: 0, y: 88, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height/3.25))
        
        calendar.delegate = self
        calendar.dataSource = self
        
        self.view.addSubview(calendar)
        
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        let calendarDate = Calendar(identifier: .gregorian)
        let year = calendarDate.component(.year, from: date)
        let month = calendarDate.component(.month, from: date)
        let day = calendarDate.component(.day, from: date)
        
        if UserDefaults.standard.object(forKey: "addORLook") as! String == "追加" {
        
        createTextFieldAlert(calendarDay: "\(year)年\(month)月\(day)日")
     
        }else{
            
            self.realmCRUDModel.filterReadRealm(calendarDay: "\(year)年\(month)月\(day)日")
            self.tableView.reloadData()
            
        }
        
        
    }
    
}
