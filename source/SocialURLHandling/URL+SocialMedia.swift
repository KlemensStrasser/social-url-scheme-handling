//
//  URL+SocialMedia.swift
//
//  Created by Klemens Strasser on 22.11.24.
//  Copyright © 2024 Tardigrade. All rights reserved.
//

import UIKit

extension URL {
    static func socialProfileURL<T: SocialMediaClient>(for profileName: String, on socialMediaPlatform: T.Type) -> URL? {
        socialMediaPlatform.allCases.compactMap {
            $0.appProfileURL(for: profileName)
        }.first {
            UIApplication.shared.canOpenURL($0)
        } ?? T.webProfileURL(for: profileName)
    }
}
