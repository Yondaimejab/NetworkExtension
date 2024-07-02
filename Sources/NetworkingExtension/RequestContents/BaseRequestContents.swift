//
//  EmptyRequestContents.swift
//  
//
//  Created by Joel Alcantara on 25/1/24.
//

import UIKit

public class BaseRequestContents: RequestContents {
    public var body: [String : Any]
    public var method: String
    public var params: [String: Any]
    public var headers: [String: String]
    
    public init(
        body: [String: Any] = [:],
        method: String = "GET",
        params: [String: Any] = [:],
        headers: [String: String] = [:]
    ) {
        self.body = body
        self.method = method
        self.params = params
        self.headers = headers
    }
}
