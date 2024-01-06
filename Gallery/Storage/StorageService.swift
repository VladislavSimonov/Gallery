//
//  StorageService.swift
//  Gallery
//
//  Created by Vladislav Simonov on 5.01.24.
//

import Foundation

protocol StorageServiceProtocol: AnyObject {
    var faivoriteImagesSet: Set<String> { get set }
}

final class StorageService: StorageServiceProtocol {
    private let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
}

extension StorageService {
    var faivoriteImagesSet: Set<String> {
        get { data(.faivoriteImagesSet)?.maybeDecoded() ?? Set<String>() }
        set { set(newValue.maybeEncoded(), key: .faivoriteImagesSet) }
    }
}

private enum Keys: String, CaseIterable {
    case faivoriteImagesSet = "gallery.faivoriteImagesSet.key"
}

private extension StorageService {
    func set(_ value: Any?, key: Keys) {
        userDefaults.setValue(value, forKey: key.rawValue)
        userDefaults.synchronize()
    }
    
    func data(_ key: Keys) -> Data? {
        userDefaults.data(forKey: key.rawValue)
    }
}
