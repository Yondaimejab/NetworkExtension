//
//  RequestBuilder.swift
//  
//
//  Created by Joel Alcantara on 25/1/24.
//

import UIKit
import Foundation
import Alamofire

public protocol RequestBuilder {
    var router: Router { get set }
    var requestContents: RequestContents { get set }
    var request: URLRequest? { get }
}

extension RequestBuilder {
    public var request: URLRequest? { buildRequest(using: router, addingContents: requestContents) }
    
    private func buildRequest(using router: Router, addingContents contents: RequestContents) -> URLRequest? {
        guard let url = buildURL(using: router, params: contents.params) else { return nil }
        guard var request = try? URLRequest(
            url: url,
            method: .init(rawValue: contents.method),
            headers: .init(contents.headers)
        ) else { return nil }
        let shouldNotAddBody = (["GET", "DELETE"].contains(contents.method)) || contents.body.isEmpty
        guard !shouldNotAddBody else { return request }
        request.httpBody = try? JSONSerialization.data(withJSONObject: contents.body)
        return request
    }
    
    private func buildURL(using router: Router, params: [String: Any]) -> URL? {
        guard var components = URLComponents(string: router.baseURL + router.path) else { return nil }
        if !params.isEmpty {
            components.queryItems = params.compactMap { key, value in
                URLQueryItem(name: key, value: String(describing: value))
            }
        }
        return try? components.asURL()
    }
}
