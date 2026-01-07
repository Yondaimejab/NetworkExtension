//
//  HTTPMethod.swift
//
//
//  Created by Joel Alcantara on 10/9/24.
//

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
    
    public var allowsBody: Bool {
        switch self {
        case .get, .delete:
            return false
        case .post, .put, .patch:
            return true
        }
    }
}
