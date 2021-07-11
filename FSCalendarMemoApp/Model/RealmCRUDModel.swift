//
//  RealmCRUDModel.swift
//  FSCalendarMemoApp
//
//  Created by UrataHiroki on 2021/07/11.
//

import Foundation
import RealmSwift

class RealmCRUDModel{
    
    var readRealmArray:[[String:String]] = []
    
}


extension RealmCRUDModel{
    
    func createRealm(createDay:String,createEvent:String,createPlace:String,createWho:String){
        
        do{
            let realm = try Realm()
            let realmDatas = RealmDatas()
            
            realmDatas.day = createDay
            realmDatas.event = createEvent
            realmDatas.place = createPlace
            realmDatas.who = createWho
            
            try realm.write({
                
                realm.add(realmDatas)
                
            })
        }catch{
            
            print(error.localizedDescription)
            
        }
    }
}


extension RealmCRUDModel{
    
    func readRealm(){
        
        do{
            let realm = try Realm()
            self.readRealmArray = []
            
            for readResult in realm.objects(RealmDatas.self){
                
                self.readRealmArray.append(["RealmEvent":readResult.event,"RealmPlace":readResult.place,"RealmWho":readResult.who])
                
            }
            
        }catch{
            
            print(error.localizedDescription)
            
        }
        
    }
  
    
}

extension RealmCRUDModel{
    
    func filterReadRealm(calendarDay:String){
        
        do{
            let realm = try Realm()
            self.readRealmArray = []
            
            for filterReadResult in realm.objects(RealmDatas.self).filter(NSPredicate(format: "day == %@", calendarDay)){
                
                self.readRealmArray.append(["RealmEvent":filterReadResult.event,"RealmPlace":filterReadResult.place,"RealmWho":filterReadResult.who])
                
            }
        }catch{
            
            
        }
        
    }
    
}


