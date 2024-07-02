//
//  ApplicationErrors.swift
//  
//
//  Created by Joel Alcantara on 16/6/24.
//

import UIKit

protocol ApplicationError: Error, CustomStringConvertible { }

struct BuildRequestError: ApplicationError {
    var description: String { "Failed To Build Request from router and contents" }
}

struct RequestInvalidStatusCode: ApplicationError {
    var description: String { "The Request Returned an invalid status code" }
}

