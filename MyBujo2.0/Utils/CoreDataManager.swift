//
//  CoreDataManager.swift
//  MyBujo2.0
//
//  Created by Adauto Pinheiro on 28/08/19.
//  Copyright © 2019 Gabriel Palhares. All rights reserved.
//

import Foundation
import UIKit
import CoreData

enum EntityType{
    case day(_: Date)
    case media
    case goal
    
    var predicate: NSPredicate{
        switch self {
        case .day(let date):
            return NSPredicate(format: "date == %@", date as NSDate)
        default:
            return NSPredicate(value: true)
        }
    }
}

extension NSManagedObject {
    static var className: String {
        return String(describing: self)
    }
}


class CoreDataManager: NSObject{
    
    static let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    static func fetch<T: NSManagedObject>(entityClass: T.Type, predicate: NSPredicate) -> Any?{
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: T.className)
        request.predicate = predicate
        do{
            let result = try? context.fetch(request)
            return result
        }
    }
    
    static func create<T: NSManagedObject>(entityType: T.Type, completion: ((NSManagedObject)->Void)? = nil){
        let entity = T(context: context)
        if let completion = completion{
            completion(entity)
            save()
        }
    }
    
    static func save(){
        do {
            try context.save()
        } catch {
            print("Failed saving")
        }
    }
}
