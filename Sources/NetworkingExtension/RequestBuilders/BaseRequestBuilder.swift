//
//  BaseRequestBuilder.swift
//  
//
//  Created by Joel Alcantara on 25/1/24.
//

import UIKit

public class BaseRequestBuilder: RequestBuilder {
    public var router: Router
    public var contents: RequestContents
    
    public init(router: Router, contents: RequestContents) {
        self.router = router
        self.contents = contents
    }
}
