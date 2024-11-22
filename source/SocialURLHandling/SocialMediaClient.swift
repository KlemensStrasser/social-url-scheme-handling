//
//  SocialMediaClient.swift
//
//  Created by Klemens Strasser on 22.11.24.
//  Copyright © 2024 Tardigrade. All rights reserved.
//

import Foundation

protocol SocialMediaClient: CaseIterable {
    static func webProfileURL(for profileName: String) -> URL?
    func appProfileURL(for profileName: String) -> URL?
    
    var name: String { get }
}
