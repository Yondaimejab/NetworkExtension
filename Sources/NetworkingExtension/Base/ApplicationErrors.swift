//
//  ApplicationErrors.swift
//  
//
//  Created by Joel Alcantara on 16/6/24.
//

import UIKit

public protocol ApplicationError: Error, CustomStringConvertible { }

public class BuildRequestError: ApplicationError {
    public init() { }
    public var description: String { "Failed To Build Request from router and contents" }
}

public class RequestInvalidStatusCode: ApplicationError {
    public init() { }
    public var description: String { "The Request Returned an invalid status code" }
}
