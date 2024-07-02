//
//  ApplicationErrors.swift
//  
//
//  Created by Joel Alcantara on 16/6/24.
//

import UIKit

public protocol ApplicationError: Error, CustomStringConvertible { }

public struct BuildRequestError: ApplicationError {
    public var description: String { "Failed To Build Request from router and contents" }
}

public struct RequestInvalidStatusCode: ApplicationError {
    public var description: String { "The Request Returned an invalid status code" }
}

