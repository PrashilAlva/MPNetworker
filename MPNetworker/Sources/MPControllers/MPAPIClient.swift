//
//  MPAPIClient.swift
//
//
//  Created by Prashil Alva on 08/02/24.
//

import Foundation

@available(iOS 15.0, *)
public struct MPAPIClient {
    
    private static var apiKey = "909594533c98883408adef5d56143539"
    
    // Supporter Function for API Consumption
    private static func getAPIData(from url: String) async throws -> Data {
        guard let urlForCall = URL(string: "\(url)?api_key=\(apiKey)") else {
            throw MPError.InvalidURL
        }
        let (data, response) = try await URLSession.shared.data(from: urlForCall)
        if let responseObtained = response as? HTTPURLResponse, responseObtained.statusCode != 200 {
            throw MPError.ServerError
        }
        return data
    }
    
    // This Function is used to Obtain the Latest (Now Playing) Movies
    public static func obtainLatestMovies() async throws -> Movies {
        let dataObtained = try await getAPIData(from: "https://api.themoviedb.org/3/movie/now_playing")
        do {
            return try JSONDecoder().decode(Movies.self, from: dataObtained)
        } catch let error {
            throw error
        }
    }
    
    // This Function is Used to Obtain the Popular Movies
    public static func obtainPopularMovies() async throws -> Movies {
        let dataObtained = try await getAPIData(from: "https://api.themoviedb.org/3/movie/popular")
        do {
            return try JSONDecoder().decode(Movies.self, from: dataObtained)
        } catch let error {
            throw error
        }
    }
    
    // This Function is Used to Obatin the Details of a Particular Movie
    public static func getDetails(for movieID: Int) async throws -> Movie{
        let dataObtained = try await getAPIData(from: "https://api.themoviedb.org/3/movie/\(movieID)")
        do {
            return try JSONDecoder().decode(Movie.self, from: dataObtained)
        } catch let error {
            throw error
        }
    }
    
    // This Function is Used to Obtain the Cast and Crew List of a Movie
    public static func getCastAndCrew(for movieID: Int) async throws -> PersonnelList {
        let dataObtained = try await getAPIData(from: "https://api.themoviedb.org/3/movie/\(movieID)/credits")
        do {
            return try JSONDecoder().decode(PersonnelList.self, from: dataObtained)
        } catch let error {
            throw error
        }
    }
    
    // This Function is Used to Obtain the Images of a Movie
    public static func getImages(for movieID: Int) async throws -> ImageList {
        let dataObtained = try await getAPIData(from: "https://api.themoviedb.org/3/movie/\(movieID)/images")
        do {
            return try JSONDecoder().decode(ImageList.self, from: dataObtained)
        } catch let error {
            throw error
        }
    }
    
    // This Function is used to Obtain the Videos of a Movie
    public static func getVideos(for movieID: Int) async throws -> VideoList {
        let dataObtained = try await getAPIData(from: "https://api.themoviedb.org/3/movie/\(movieID)/videos")
        do {
            return try JSONDecoder().decode(VideoList.self, from: dataObtained)
        } catch let error {
            throw error
        }
    }
    
    // This Function is used to Obtain the Keywords related to a Movie
    public static func getKeywords(for movieID: Int) async throws -> Keywords {
        let dataObtained = try await getAPIData(from: "https://api.themoviedb.org/3/movie/\(movieID)/keywords")
        do {
            return try JSONDecoder().decode(Keywords.self, from: dataObtained)
        } catch let error {
            throw error
        }
    }
    
    
}
