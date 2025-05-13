//
//  EmptyRequestContents.swift
//
//
//  Created by Joel Alcantara on 25/1/24.
//

public struct BaseRequestContents: RequestContents {
    public let method: String
    public let params: [String: Any]
    public let headers: [String: String]
    
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
