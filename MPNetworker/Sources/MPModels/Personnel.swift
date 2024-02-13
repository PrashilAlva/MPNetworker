//
//  Personnel.swift
//
//
//  Created by Prashil Alva on 08/02/24.
//

import Foundation

public struct Personnel: Codable, Identifiable, Hashable {
    public var id = UUID()
    public var responsibility: String
    public var name: String
    public var originalName: String
    public var profilePath: String?
    public var character: String?
    public var job: String?
    
    enum CodingKeys: String, CodingKey {
        case name, character, job
        case responsibility = "known_for_department"
        case originalName = "original_name"
        case profilePath = "profile_path"
    }
}

public struct PersonnelList: Codable {
    public var cast: [Personnel]
    public var crew: [Personnel]
    
    public init() {
        self.cast = []
        self.crew = []
    }
}
