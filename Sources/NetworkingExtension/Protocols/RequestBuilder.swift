//
//  RequestBuilder.swift
//  
//
//  Created by Joel Alcantara on 25/1/24.
//

import UIKit
import Foundation

public protocol RequestBuilder {
    var route: APIRoute { get }
    var contents: RequestContents { get }
    var request: URLRequest? { get }
}

extension RequestBuilder {
    public var request: URLRequest? {
        buildRequest(using: route, addingContents: contents)
    }
    
    private func buildRequest(using route: APIRoute, addingContents contents: RequestContents) -> URLRequest? {
        guard let url = buildURL(using: route, params: contents.params) else { return nil }
        var customURLRequest = URLRequest(url: url)
        customURLRequest.allHTTPHeaderFields = contents.headers
        customURLRequest.httpMethod = contents.method
        let needsToPreventBodyInsertion = (["GET", "DELETE"].contains(contents.method))
        guard !needsToPreventBodyInsertion else { return customURLRequest }
        customURLRequest.httpBody = try? JSONSerialization.data(withJSONObject: contents.params)
        return customURLRequest
    }
    
    private func buildURL(using route: APIRoute, params: [String: Any]) -> URL? {
        guard var components = URLComponents(string: route.url) else { return nil }
        if !params.isEmpty {
            components.queryItems = params.compactMap { key, value in
                URLQueryItem(name: key, value: String(describing: value))
            }
        }
        return components.url
    }
}
