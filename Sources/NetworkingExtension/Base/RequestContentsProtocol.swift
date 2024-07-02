//
//  RequestContentsProtocol.swift
//  
//
//  Created by Joel Alcantara on 25/1/24.
//

import UIKit

public protocol RequestContents {
    var method: String { get set }
    var params: [String: Any] { get set }
    var headers: [String: String] { get set }
}
