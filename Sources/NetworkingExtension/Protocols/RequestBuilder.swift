//
//  RequestBuilder.swift
//  
//
//  Created by Joel Alcantara on 25/1/24.
//

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
        guard let url = buildURL(using: route, queryParameters: contents.queryParameters) else { return nil }
        var customURLRequest = URLRequest(url: url)
        var headers = contents.headers
        if let bodyHeaders = contents.body?.additionalHeaders {
            headers.merge(bodyHeaders, uniquingKeysWith: { _, new in new })
        }
        customURLRequest.allHTTPHeaderFields = headers
        customURLRequest.httpMethod = contents.method.rawValue
        guard contents.method.allowsBody, let body = contents.body else { return customURLRequest }
        customURLRequest.httpBody = body.data
        return customURLRequest
    }
    
    private func buildURL(using route: APIRoute, queryParameters: [String: Any]) -> URL? {
        guard var components = URLComponents(string: route.url) else { return nil }
        if !queryParameters.isEmpty {
            components.queryItems = queryParameters.compactMap { key, value in
                URLQueryItem(name: key, value: String(describing: value))
            }
        }
        return components.url
    }
}
