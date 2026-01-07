//
//  EmptyRequestContents.swift
//
//
//  Created by Joel Alcantara on 25/1/24.
//

public struct BaseRequestContents: RequestContents {
    public let method: HTTPMethod
    public let queryParameters: [String: Any]
    public let headers: [String: String]
    public let body: RequestBody?
    
    public init(
        method: HTTPMethod = .get,
        queryParameters: [String: Any] = [:],
        headers: [String: String] = [:],
        body: RequestBody? = nil
    ) {
        self.method = method
        self.queryParameters = queryParameters
        self.headers = headers
        self.body = body
    }
}
