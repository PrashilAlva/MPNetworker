//
//  MPVideo.swift
//
//
//  Created by Prashil Alva on 08/02/24.
//

import Foundation

public struct MPVideo: Codable, Identifiable, Hashable {
    public var id = UUID()
    public var name: String
    public var key: String
    public var site: String
    
    enum CodingKeys: String, CodingKey {
        case name, key, site
    }
}

public struct VideoList: Codable {
    public var results: [MPVideo]
    
    public init() {
        self.results = []
    }
}
