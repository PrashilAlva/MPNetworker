//
//  Movie.swift
//
//
//  Created by Prashil Alva on 08/02/24.
//

import Foundation

public struct Movies: Codable {
    public var results: [Movie]
    
    public init() {
        self.results = []
    }
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}

public struct Movie: Codable, Identifiable, Hashable {
    public var id: Int
    public var adult: Bool
    public var originalLanguage: String
    public var originalTitle: String
    public var posterPath: String
    public var releaseDate: String
    public var title: String
    public var voteAverage: Double
    public var backdropPath: String?
    public var budget: Int?
    public var genres: [Genre]?
    public var overview: String?
    public var revenue: Int?
    public var runtime: Int?
    public var voteCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, adult, title, budget, genres, overview, revenue, runtime
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case backdropPath = "backdrop_path"
        case voteCount = "vote_count"
    }
}

public struct Genre: Codable, Identifiable, Hashable {
    public var id = UUID()
    public var name: String
    
    enum CodingKeys: String, CodingKey {
        case name
    }
}

