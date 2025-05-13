//
//  APIRoute.swift
//
//
//  Created by Joel Alcantara on 25/1/24.
//

public protocol APIRoute {
    var path: String { get }
    var url: String { get }
}

public struct Environment {
    public let baseUrl: String
    
    public init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
}

public struct CustomEnvironmentRoute: APIRoute {
    public let path: String
    public let environment: Environment
    
    public init(environment: Environment, path: String) {
        self.environment = environment
        self.path = path
    }
    
    public var url: String { buildURL(for: environment) }
    
    func buildURL(for environment: Environment) -> String {
        return environment.baseUrl + path
    }
}
