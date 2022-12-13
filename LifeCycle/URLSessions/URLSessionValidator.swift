//
//  URLSessionValidator.swift
//  LifeCycle
//
//  Created by Admin on 20/10/22.
//

import Foundation

struct URLSessionValidator{
    func validateCreateUserInput(name: String?, job: String?) -> Bool{
        if(name == "" || job == ""){
            return false
        }
        return true
    }
}
