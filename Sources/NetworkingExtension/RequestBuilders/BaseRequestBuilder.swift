//
//  BaseRequestBuilder.swift
//  
//
//  Created by Joel Alcantara on 25/1/24.
//

import UIKit

public class BaseRequestBuilder: RequestBuilder {
    public var router: Router
    public var requestContents: RequestContents
    
    public init(router: Router, requestContents: RequestContents) {
        self.router = router
        self.requestContents = requestContents
    }
}
