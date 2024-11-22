//
//  URL+Mastodon.swift
//
//  Created by Klemens Strasser on 22.11.24.
//  Copyright © 2024 Tardigrade. All rights reserved.
//

import Foundation

enum MastodonClient: SocialMediaClient {
    case ivory
    case radiant
    
    case official
    
    // Not working well at the moment
    case iceCubes
    case mammoth

    
    // MARK: URL
    
    static func webProfileURL(for profileName: String) -> URL? {
        guard let (userName, instance) = getInstanceAndUserName(for: profileName) else {
            return nil
        }
        
        return URL(string: "https://\(instance)/\(userName)")
    }
    
    func appProfileURL(for profileName: String) -> URL? {
        switch self {
        case .official:
            return URL(string: "mastodon://profile/\(profileName)")
        case .ivory:
            // Documented: https://tapbots.com/support/ivory/tips/urlschemes
            return URL(string: "ivory://acct/user_profile/\(profileName)")
        case .radiant:
            // radiant://[instance]/@[profileName]
            guard let (userName, instance) = Self.getInstanceAndUserName(for: profileName) else {
                return nil
            }
            
            return URL(string: "radiant://\(instance)/\(userName)")
        case .iceCubes:
            // Does only open the in-app browser
            // icecubesapp://[instance]/@[profileName]
            guard let (userName, instance) = Self.getInstanceAndUserName(for: profileName) else {
                return nil
            }
            
            return URL(string: "icecubesapp://\(instance)/\(userName)")
        case .mammoth:
            // URL scheme still unknown
            return nil
        }
    }
    
    private static func getInstanceAndUserName(for profileName: String) -> (instance: String, userName: String)? {
        let parts = profileName.split(separator: "@", maxSplits: 1).map {
            String($0)
        }
        
        guard parts.count == 2 else {
            return nil
        }
        
        return ("@" + parts[0], parts[1])
    }
    
    // MARK: Metadata
    
    var name: String {
        switch self {
        case .official:
            return "Mastodon"
        case .ivory:
            return "Ivory"
        case .iceCubes:
            return "Ice Cubes"
        case .mammoth:
            return "Mammoth"
        case .radiant:
            return "Radiant"
        }
    }
}

extension URL {
    static func mastodonProfileURL(for profileName: String) -> URL? {
        socialProfileURL(for: profileName, on: MastodonClient.self)
    }
}
