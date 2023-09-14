//
//  API_helper.swift
//  Assignment-1
//
//  Created by Daphne Rivera on 2023-09-13.
//



import UIKit

enum API_Errors: Error {
    case CANNOT_PARSE_DATA_INTO_JSON
    case CANNOT_CONVERT_STRING_TO_URL
}

// MARK: - Helper Classes for APIs

class CoffeeAPI_Helper {
    static private let baseURL_String = "https://coffee.alexflipnote.dev/random.json"
    
    static public func fetch() async throws -> Any {
            return try await fetchAPI(urlString: baseURL_String)
        }
}

class DogFactsAPI_Helper {
    static private let baseURL_String = "https://dogapi.dog/api-docs/v2/swagger.json"
    
    static public func fetch() async throws -> Any {
            return try await fetchAPI(urlString: baseURL_String)
        }
}

class CatAPI_Helper {
    static private let baseURL_String = "https://api.thecatapi.com/v1/images/search"
    
    static public func fetch() async throws -> Any {
            return try await fetchAPI(urlString: baseURL_String)
        }
}

// MARK: - Generic Function to Fetch Data

func fetchAPI(urlString: String) async throws -> Any {
    guard let url = URL(string: urlString) else {
        throw API_Errors.CANNOT_CONVERT_STRING_TO_URL
    }

    do {
        let (data, _) = try await URLSession.shared.data(from: url)
        let jsonObject = try JSONSerialization.jsonObject(with: data)
        return jsonObject
    } catch {
        throw error
    }
}
