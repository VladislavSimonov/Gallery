//
//  ServiceProvider.swift
//  Gallery
//
//  Created by Vladislav Simonov on 7.01.24.
//

import Foundation

protocol NetworkProviderProtocol {
    var network: NetworkingManagerProtocol { get }
}

protocol StorageProviderProtocol {
    var storage: StorageServiceProtocol { get }
}

protocol ServiceProviderProtocol: StorageProviderProtocol, NetworkProviderProtocol { }

final class ServiceProvider: ServiceProviderProtocol {
    let storage: StorageServiceProtocol = StorageService()
    let network: NetworkingManagerProtocol = NetworkingManager()
}
