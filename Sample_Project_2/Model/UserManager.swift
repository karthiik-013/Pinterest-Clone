//
//  UserManager.swift
//  Sample_Project_2
//
//  Created by Karthik Sudarsan on 08/05/24.
//

import Foundation

struct UserManager{
    let defaults = UserDefaults.standard
    
    func storeUser(user: User){
        let encoder = JSONEncoder()
        if let encodedUser = try? encoder.encode(user){
            defaults.set(encodedUser,forKey: user.name)
        }
    }
    
    func retrieveUser(username:String)-> User? {
        if let userData = defaults.data(forKey: username),let decodedUser = try? JSONDecoder().decode(User.self, from: userData){
            return decodedUser
        }
        return nil
    }
    
}
