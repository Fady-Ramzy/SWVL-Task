//
//  CharactersSearch.swift
//  The Hitchhiker Prophecy
//
//  Created by Mohamed Matloub on 6/10/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import Foundation

extension Characters.Search {
    public struct Input: Codable {
        let timeStamp: String
        let apiKey: String
        let hash: String
        let offset: Int
        let limit: Int
        let orderBy: Order
        
        enum CodingKeys: String, CodingKey {
            case timeStamp = "ts"
            case apiKey = "apikey"
            case hash, offset, limit, orderBy
        }
    }
}

extension Characters.Search.Input {
    enum Order: String, Codable {
        case nameAscending = "name"
        case modifiedDateAscending = "modified"
        case nameDescending = "-name"
        case modifiedDateDescending = "-modified"
    }
}

// MARK: - Output
extension Characters.Search {
    public struct Output: Codable {
        let code: Int
        let status, copyright, attributionText, attributionHTML: String
        let etag: String
        var data: Results
        
        // MARK: - Initializers
        
        public init(code: Int, status: String, copyright: String, attributionText: String, attributionHTML: String, etag: String, data: Results) {
            self.code = code
            self.status = status
            self.copyright = copyright
            self.attributionText = attributionText
            self.attributionHTML = attributionHTML
            self.etag = etag
            self.data = data
        }
    }
}

// MARK: - Results
extension Characters.Search {
    public struct Results: Codable {
        
        // MARK: - Properties
        
        var offset, limit, total, count: Int
        var results: [Character]
        
        // MARK: - Initializers
        
        public init(offset: Int, limit: Int, total: Int, count: Int, results: [Character]) {
            self.offset = offset
            self.limit = limit
            self.total = total
            self.count = count
            self.results = results
        }
    }
}
// MARK: - Character
extension Characters.Search {
    public struct Character: Codable {
        
        // MARK: - Properties
        
        var id: Int!
        var name, resultDescription: String!
        var modified: String!
        var thumbnail: Thumbnail!
        var resourceURI: String!
        var comics, series: Comics!
        var stories: Stories!
        var events: Comics!
        var urls: [URLElement]!
        
        // MARK: - Initializers
        
        public init(id: Int, name: String, resultDescription: String, modified: String, thumbnail: Thumbnail, resourceURI: String, comics: Comics, series: Comics, stories: Stories, events: Comics, urls: [URLElement]) {
            self.id = id
            self.name = name
            self.resultDescription = resultDescription
            self.modified = modified
            self.thumbnail = thumbnail
            self.resourceURI = resourceURI
            self.comics = comics
            self.series = series
            self.stories = stories
            self.events = events
            self.urls = urls  
        }
        
        enum CodingKeys: String, CodingKey {
            case id, name
            case resultDescription = "description"
            case modified, thumbnail, resourceURI, comics, series, stories, events, urls
        }
    }
}

// MARK: - Comics

extension Characters.Search.Character {
    public struct Comics: Codable {
        
        // MARK: - Properties
        
        let available: Int
        let collectionURI: String
        let items: [ComicsItem]
        let returned: Int
        
        // MARK: - Initializers
        
        public init(available: Int, collectionURI: String, items: [ComicsItem], returned: Int) {
            self.available = available
            self.collectionURI = collectionURI
            self.items = items
            self.returned = returned
        }
    }
}

// MARK: - ComicsItem
extension Characters.Search.Character.Comics {
    public struct ComicsItem: Codable {
        
        // MARK: - Properties
        
        let resourceURI: String
        let name: String
        
        // MARK: - Initializers
        
        public init(resourceURI: String, name: String) {
            self.resourceURI = resourceURI
            self.name = name
        }
    }
}

// MARK: - Stories
extension Characters.Search.Character {
    public struct Stories: Codable {
        
        // MARK: - Properties
        
        let available: Int
        let collectionURI: String
        let items: [StoriesItem]
        let returned: Int
        
        // MARK: - Initializers
        
        public init(available: Int, collectionURI: String, items: [StoriesItem], returned: Int) {
            self.available = available
            self.collectionURI = collectionURI
            self.items = items
            self.returned = returned
        }
    }
}

// MARK: - StoriesItem
extension Characters.Search.Character.Stories {
    public struct StoriesItem: Codable {
        
        // MARK: - Properties
        
        let resourceURI: String
        let name: String
        let type: String
        
        // MARK: - Initializers
        
        public init(resourceURI: String, name: String, type: String) {
            self.resourceURI = resourceURI
            self.name = name
            self.type = type
        }
    }
}

// MARK: - Thumbnail
extension Characters.Search.Character {
    public struct Thumbnail: Codable {
        
        // MARK: - Properties
        
        let path: String
        let thumbnailExtension: String
        
        // MARK: - Initializers
        
        public init(path: String, thumbnailExtension: String) {
            self.path = path
            self.thumbnailExtension = thumbnailExtension
        }
        
        enum CodingKeys: String, CodingKey {
            case path
            case thumbnailExtension = "extension"
        }
    }
}

// MARK: - URLElement
extension Characters.Search.Character {
    public struct URLElement: Codable {
        let type: URLType
        let url: String
        
        // MARK: - Initializers
        
        public init(type: URLType, url: String) {
            self.type = type
            self.url = url
        }
    }
}

extension Characters.Search.Character.URLElement {
    public enum URLType: String, Codable {
        case comiclink = "comiclink"
        case detail = "detail"
        case wiki = "wiki"
    }
}
