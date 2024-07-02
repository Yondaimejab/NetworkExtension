//
//  UserClient.swift
//  
//
//  Created by Joel Alcantara on 16/6/24.
//

import UIKit

class UserClient: Client {
    private let router = Router(baseURL: "https://jsonplaceholder.typicode.com/")
    
    func fetch(identifiedBy identifier: Int) async throws -> User {
        router.path = "users/\(identifier)"
        let (data, _) = try await buildAndSendBaseRequest(router: router)
        return try JSONDecoder() .decode(User.self, from: data)
    }
    
    func fetchList() async throws -> [User] {
        router.path = "users"
        let (data, _) = try await buildAndSendBaseRequest(router: router)
        return try JSONDecoder().decode([User].self, from: data)
    }
    
    private func buildAndSendBaseRequest(router: Router) async throws -> (Data, URLResponse) {
        let requestBuilder = BaseRequestBuilder(router: router, contents: BaseRequestContents())
        guard let request = requestBuilder.request else {
            throw BuildRequestError()
        }
        return try await URLSession.shared.data(for: request)
    }
    
    func save(_ model: User) async throws {
        // Implement save logic here
    }
    
    func deleteModel(identifiedBy identifier: Int) async throws {
        router.path = "post/1"
        let deleteRequestContents = BaseRequestContents(method: "DELETE")
        let requestBuilder = BaseRequestBuilder(router: router, contents: deleteRequestContents)
        guard let request = requestBuilder.request else {
            throw BuildRequestError()
        }
        let (_, response) = try await URLSession.shared.data(for: request)
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
            throw RequestInvalidStatusCode()
        }
        guard statusCode > 199 && statusCode < 300 else {
            throw RequestInvalidStatusCode()
        }
    }
}
