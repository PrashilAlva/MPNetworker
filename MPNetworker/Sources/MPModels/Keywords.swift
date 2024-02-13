//
//  Keywords.swift
//
//
//  Created by Prashil Alva on 08/02/24.
//

import Foundation

public struct Keyword: Codable, Identifiable, Hashable {
    public var id = UUID()
    public var name: String
    
    enum CodingKeys: String, CodingKey {
        case name
    }
}

public struct Keywords: Codable {
    public var keywords: [Keyword]
    
    public init() {
        self.keywords = []
    }
}
