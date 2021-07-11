//
//  RealmDatas.swift
//  FSCalendarMemoApp
//
//  Created by UrataHiroki on 2021/07/11.
//

import Foundation
import RealmSwift

 
class RealmDatas:Object{
    
    @objc dynamic var day = String()
    @objc dynamic var event = String()
    @objc dynamic var place = String()
    @objc dynamic var who = String()
    
}
