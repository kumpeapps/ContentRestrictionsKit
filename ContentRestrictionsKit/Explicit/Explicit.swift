//
//  Explicit.swift
//  ContentRestrictionsKit
//
//  Created by Justin Kumpe on 12/9/20.
//

import Foundation

public class Explicit {

    // MARK: isExplicitBooksAllowed
    /// Gets Device's explicit books allowed restriction setting (returns bool)
    public class func isExplicitBooksAllowed() -> Bool {
        let explicitBooksAllowedSetting:Int = UserDefaults.standard.object(forKey: "com.apple.content-rating.ExplicitBooksAllowed") as? Int ?? 0
        let isAllowed: Bool = (explicitBooksAllowedSetting != 0)
        return isAllowed
    }

    // MARK: isExplicitMusicAllowed
    /// Gets Device's explicit music podcasts allowed restriction setting (returns bool)
    public class func isExplicitMusicAllowed() -> Bool {
        let explicitMusicAllowedSetting:Int = UserDefaults.standard.object(forKey: "com.apple.content-rating.ExplicitMusicPodcastsAllowed") as? Int ?? 0
        let isAllowed: Bool = (explicitMusicAllowedSetting != 0)
        return isAllowed
    }

}
