//
//  Encodable+Extensions.swift
//  Gallery
//
//  Created by Vladislav Simonov on 6.01.24.
//

import Foundation

extension Encodable {
    func maybeEncoded() -> Data? {
        try? encoded()
    }

    private func encoded() throws -> Data {
        try JSONEncoder().encode(self)
    }
}
