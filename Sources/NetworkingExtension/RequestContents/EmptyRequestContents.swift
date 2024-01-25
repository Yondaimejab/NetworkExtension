//
//  EmptyRequestContents.swift
//  
//
//  Created by Joel Alcantara on 25/1/24.
//

import UIKit

public class EmptyRequestContents: RequestContents {
    public var body: [String : Any] = [:]
    public var method: String = "GET"
    public var params: [String: Any] = [:]
    public var headers: [String: String] = [:]
    
    public init() {}
}
