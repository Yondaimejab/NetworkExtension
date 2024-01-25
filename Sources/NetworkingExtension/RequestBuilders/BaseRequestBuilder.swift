//
//  BaseRequestBuilder.swift
//  
//
//  Created by Joel Alcantara on 25/1/24.
//

import UIKit

class BaseRequestBuilder: RequestBuilder {
    var router: Router
    var requestContents: RequestContents
    
    public init(router: Router, requestContents: RequestContents) {
        self.router = router
        self.requestContents = requestContents
    }
}
