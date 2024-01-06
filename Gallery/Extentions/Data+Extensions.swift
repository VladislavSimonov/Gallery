//
//  Data+Extensions.swift
//  Gallery
//
//  Created by Vladislav Simonov on 6.01.24.
//

import Foundation

extension Data {
    func maybeDecoded<T: Decodable>() -> T? {
        try? decoded()
    }

    private func decoded<T: Decodable>() throws -> T {
        try JSONDecoder().decode(T.self, from: self)
    }
}
