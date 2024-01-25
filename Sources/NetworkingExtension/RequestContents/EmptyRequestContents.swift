//
//  EmptyRequestContents.swift
//  
//
//  Created by Joel Alcantara on 25/1/24.
//

import UIKit

class EmptyRequestContents: RequestContents {
    var body: [String : Any] = [:]
    var method: String = "GET"
    var params: [String: Any] = [:]
    var headers: [String: String] = [:]
    
    init() {}
}
