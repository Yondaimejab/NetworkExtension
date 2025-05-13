//
//  RequestContentsProtocol.swift
//  
//
//  Created by Joel Alcantara on 25/1/24.
//

import UIKit

public protocol RequestContents {
    var method: String { get }
    var params: [String: Any] { get }
    var headers: [String: String] { get }
}
