//
//  Router.swift
//  
//
//  Created by Joel Alcantara on 25/1/24.
//

import UIKit

public protocol Router {
    var baseURL: String { get }
    var path: String { get }
}
