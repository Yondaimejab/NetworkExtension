//
//  Router.swift
//  
//
//  Created by Joel Alcantara on 25/1/24.
//

import UIKit

public class Router {
    public let baseURL: String
    public var path: String
    
    public init(baseURL: String, path: String = "") {
        self.baseURL = baseURL
        self.path = path
    }
}
