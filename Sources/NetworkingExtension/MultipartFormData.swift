//
//  MultipartFormData.swift
//
//
//  Created by Joel Alcantara on 10/9/24.
//

import Foundation

public struct MultipartFormDataPart {
    public let name: String
    public let filename: String?
    public let mimeType: String?
    public let data: Data
    
    public init(name: String, filename: String? = nil, mimeType: String? = nil, data: Data) {
        self.name = name
        self.filename = filename
        self.mimeType = mimeType
        self.data = data
    }
    
    public static func file(name: String, fileURL: URL, mimeType: String? = nil) throws -> MultipartFormDataPart {
        let data = try Data(contentsOf: fileURL)
        return MultipartFormDataPart(name: name, filename: fileURL.lastPathComponent, mimeType: mimeType, data: data)
    }
}

public struct MultipartFormData {
    public let parts: [MultipartFormDataPart]
    public let boundary: String
    
    public init(parts: [MultipartFormDataPart], boundary: String = UUID().uuidString) {
        self.parts = parts
        self.boundary = boundary
    }
    
    public var contentType: String {
        "multipart/form-data; boundary=\(boundary)"
    }
    
    public func bodyData() -> Data {
        var body = Data()
        let lineBreak = "\r\n"
        
        for part in parts {
            body.append("--\(boundary)\(lineBreak)".data(using: .utf8) ?? Data())
            body.append("Content-Disposition: form-data; name=\"\(part.name)\"".data(using: .utf8) ?? Data())
            if let filename = part.filename {
                body.append("; filename=\"\(filename)\"".data(using: .utf8) ?? Data())
            }
            body.append(lineBreak.data(using: .utf8) ?? Data())
            if let mimeType = part.mimeType {
                body.append("Content-Type: \(mimeType)\(lineBreak)".data(using: .utf8) ?? Data())
            }
            body.append(lineBreak.data(using: .utf8) ?? Data())
            body.append(part.data)
            body.append(lineBreak.data(using: .utf8) ?? Data())
        }
        body.append("--\(boundary)--\(lineBreak)".data(using: .utf8) ?? Data())
        return body
    }
}
