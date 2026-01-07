//
//  RequestContentsProtocol.swift
//  
//
//  Created by Joel Alcantara on 25/1/24.
//

import Foundation

public protocol RequestContents {
    var method: HTTPMethod { get }
    var queryParameters: [String: Any] { get }
    var headers: [String: String] { get }
    var body: RequestBody? { get }
}
