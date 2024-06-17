//
//  Router.swift
//  
//
//  Created by Joel Alcantara on 25/1/24.
//

import UIKit

public class Router {
    let baseURL: String
    var path: String
    
    init(baseURL: String, path: String = "") {
        self.baseURL = baseURL
        self.path = path
    }
}
