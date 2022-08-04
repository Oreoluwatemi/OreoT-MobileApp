//
//  User.swift
//  GROUP2_MILESTONE2
//
//  Created by Oreoluwa Lawal on 2022-07-25.
//

import Foundation

struct User{
    let firstname: String
    let lastname: String
    let email: String
    
    init(f : String, l : String, e : String){
        firstname = f
        lastname =  l
        email = e
    }
    
    func toAnyObject() -> Any {
        return [
            "firstname": firstname,
            "lastname": lastname,
            "email": email
        ]
    }
}
