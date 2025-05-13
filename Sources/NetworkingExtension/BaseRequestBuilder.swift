//
//  BaseRequestBuilder.swift
//  
//
//  Created by Joel Alcantara on 25/1/24.
//

final public class BaseRequestBuilder: RequestBuilder {
    public let route: APIRoute
    public let contents: RequestContents
    
    public init(route: APIRoute, contents: RequestContents) {
        self.route = route
        self.contents = contents
    }
}
