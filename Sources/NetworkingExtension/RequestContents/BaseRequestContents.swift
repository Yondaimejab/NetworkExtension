//
//  EmptyRequestContents.swift
//  
//
//  Created by Joel Alcantara on 25/1/24.
//

import UIKit

public class BaseRequestContents: RequestContents {
    public var method: String
    public var params: [String: Any]
    public var headers: [String: String]
    
    public init(
        method: String = "GET",
        params: [String: Any] = [:],
        headers: [String: String] = [:]
    ) {
        self.method = method
        self.params = params
        self.headers = headers
    }
}
