//
//  Client.swift
//  
//
//  Created by Joel Alcantara on 16/6/24.
//

import Foundation

protocol Client {
    associatedtype Model: Decodable
    associatedtype Identifier
    
    func fetch(identifiedBy identifier: Identifier) async throws -> Model
    func fetchList() async throws -> [Model]
    func save(_ model: Model) async throws
    func deleteModel(identifiedBy identifier: Identifier) async throws
}
