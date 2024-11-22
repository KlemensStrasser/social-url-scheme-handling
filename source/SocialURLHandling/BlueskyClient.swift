//
//  URL+Bluesky.swift
//
//  Created by Klemens Strasser on 22.11.24.
//  Copyright © 2024 Tardigrade. All rights reserved.
//

import Foundation

enum BlueskyClient: SocialMediaClient {
    case skeets
    case graysky
    
    case official
    
    // MARK: URL
    
    static func webProfileURL(for profileName: String) -> URL? {
        return URL(string: "https://bsky.app/profile/\(profileName)")
    }
    
    func appProfileURL(for profileName: String) -> URL? {
        switch self {
        case .official:
            // Universal Link, opens the main Bluesky client
            return Self.webProfileURL(for: profileName)
        case .skeets:
            // skeets://bskylink?link=https://bsky.app/profile/strasser.bsky.social
            return URL(string: "skeets://bskylink?link=https://bsky.app/profile/\(profileName)")
        case .graysky:
            // URL scheme still unknown
            return nil
        }
    }
    
    // MARK: Metadata
    
    var name: String {
        switch self {
        case .official:
            return "Bluesky"
        case .skeets:
            return "Skeets"
        case .graysky:
            return "Graysky"
        }
    }
}

extension URL {
    static func blueskyProfileURL(for profileName: String) -> URL? {
        socialProfileURL(for: profileName, on: BlueskyClient.self)
    }
}
