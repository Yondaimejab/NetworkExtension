//
//  RequestBody.swift
//
//
//  Created by Joel Alcantara on 10/9/24.
//

import Foundation

public enum RequestBody {
    case json([String: Any])
    case data(Data, contentType: String?)
    case multipart(MultipartFormData)
    
    var data: Data {
        switch self {
        case .json(let payload):
            return (try? JSONSerialization.data(withJSONObject: payload)) ?? Data()
        case .data(let payload, _):
            return payload
        case .multipart(let formData):
            return formData.bodyData()
        }
    }
    
    var additionalHeaders: [String: String] {
        switch self {
        case .json:
            return ["Content-Type": "application/json"]
        case .data(_, let contentType):
            guard let contentType else { return [:] }
            return ["Content-Type": contentType]
        case .multipart(let formData):
            return ["Content-Type": formData.contentType]
        }
    }
}
