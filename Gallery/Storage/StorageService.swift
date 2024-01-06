//
//  StorageService.swift
//  Gallery
//
//  Created by Vladislav Simonov on 5.01.24.
//

import Foundation

protocol StorageServiceProtocol: AnyObject {
    func addToFavourites(_ string: String)
    func removeFromFavourites(_ string: String)
    func isFavourite(_ string: String) -> Bool
}

final class StorageService: StorageServiceProtocol {
    private let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
    func isFavourite(_ string: String) -> Bool {
        favoriteImagesSet.contains(string)
    }
    
    func addToFavourites(_ string: String) {
        favoriteImagesSet.insert(string)
    }
    
    func removeFromFavourites(_ string: String) {
        favoriteImagesSet.remove(string)
    }
}

extension StorageService {
    var favoriteImagesSet: Set<String> {
        get { data(.favoriteImagesSet)?.maybeDecoded() ?? Set<String>() }
        set { set(newValue.maybeEncoded(), key: .favoriteImagesSet) }
    }
}

private enum Keys: String {
    case favoriteImagesSet = "gallery.faivoriteImagesSet.key"
}

private extension StorageService {
    func set(_ value: Any?, key: Keys) {
        userDefaults.setValue(value, forKey: key.rawValue)
    }
    
    func data(_ key: Keys) -> Data? {
        userDefaults.data(forKey: key.rawValue)
    }
}
