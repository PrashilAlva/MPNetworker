//
//  MPImage.swift
//
//
//  Created by Prashil Alva on 08/02/24.
//

import Foundation

public struct MPImage: Codable, Identifiable, Hashable {
    public var id = UUID()
    public var aspectRatio: Double
    public var height: Int
    public var width: Int
    public var filePath: String
    
    enum CodingKeys: String, CodingKey {
        case height, width
        case aspectRatio = "aspect_ratio"
        case filePath = "file_path"
    }
}

public struct ImageList: Codable {
    public var backdrops: [MPImage]
    public var logos: [MPImage]
    public var posters: [MPImage]
    
    public init() {
        self.backdrops = []
        self.logos = []
        self.posters = []
    }
}
