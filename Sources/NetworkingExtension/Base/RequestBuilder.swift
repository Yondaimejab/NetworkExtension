//
//  RequestBuilder.swift
//  
//
//  Created by Joel Alcantara on 25/1/24.
//

import UIKit
import Foundation

public protocol RequestBuilder {
    var router: Router { get set }
    var contents: RequestContents { get set }
    var request: URLRequest? { get }
}

extension RequestBuilder {
    public var request: URLRequest? { buildRequest(using: router, addingContents: contents) }
    
    private func buildRequest(using router: Router, addingContents contents: RequestContents) -> URLRequest? {
        guard let url = buildURL(using: router, params: contents.params) else { return nil }
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = contents.headers
        request.httpMethod = contents.method
        let shouldNotAddBody = (["GET", "DELETE"].contains(contents.method))
        guard !shouldNotAddBody else { return request }
        request.httpBody = try? JSONSerialization.data(withJSONObject: contents.params)
        return request
    }
    
    private func buildURL(using router: Router, params: [String: Any]) -> URL? {
        guard var components = URLComponents(string: router.baseURL + router.path) else { return nil }
        if !params.isEmpty {
            components.queryItems = params.compactMap { key, value in
                URLQueryItem(name: key, value: String(describing: value))
            }
        }
        return components.url
    }
}
