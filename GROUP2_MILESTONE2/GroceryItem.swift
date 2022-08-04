//
//  GroceryItem.swift
//  GROUP2_MILESTONE2
//
//  Created by Oreoluwa Lawal on 2022-08-03.
//

import Foundation
import Firebase

struct GroceryItem {
    
    //MARK: - This item will be saved on Firebase under a user
    
    //MARK: - These are the properties for a grocery item
    
    let ref: DatabaseReference?
    let key: String
    let name: String
    let imgurl: String
    let expiry: String
    let quantity: String
    
    init(name: String, imgurl: String, expiry: String,quantity: String, key: String = "") {
        //MARK: - Regular offline init, there will be database reference
        self.ref = nil
        self.key = key
        self.name = name
        self.imgurl = imgurl
        self.expiry = expiry
        self.quantity = quantity
        
    }
    
    init?(snapshot: DataSnapshot) {
        //MARK: - Database is taking a snapshot of the grovery item once it has been initialized, sends item to Firebase database
        
        guard
            let value = snapshot.value as? [String: AnyObject],
            let name = value["name"] as? String,
            let imgurl = value["imgurl"] as? String,
            let expiry = value["expiry"] as? String,
            let quantity = value["quantity"] as? String else {
                return nil
            }
        //MARK: - Read items from online and set them within our app as grocery items
        self.ref = snapshot.ref
        self.key = snapshot.key
        self.name = name
                self.imgurl = imgurl
                self.expiry = expiry
                self.quantity = quantity
    }
    
    func toAnyObject() -> Any {
        return [
            "name": name,
            "imgurl": imgurl,
            "expiry" :expiry,
            "quantity": quantity
        ]
    }
    
    
}
