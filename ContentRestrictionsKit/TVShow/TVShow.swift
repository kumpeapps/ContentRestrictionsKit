//
//  TV.swift
//  ContentRestrictionsKit
//
//  Created by Justin Kumpe on 12/9/20.
//

import Foundation

public class TVShow {

    // MARK: getDeviceRestrictionValue
    /// Gets Device's tv show restriction setting as raw value
    public class func getDeviceRestrictionValue() -> Int {
        let movieRestrictionSetting = UserDefaults.standard.object(forKey: "com.apple.content-rating.TVShowRating") as? Int ?? 1000
        return movieRestrictionSetting
    }

    // MARK: getDeviceRestrictionName
    /// Gets Device's TV Show restriction setting as name using supplied country's rating system
    public class func getDeviceRestrictionName(country: Country) -> String {
        switch country {
        case .US:
            return US.getDeviceRestrictionName()
        }
    }

    // MARK: getRatingValue
    /// Get iOS raw value of TV Show rating
    public class func getRatingValue(country: Country, rating: String) -> Int {
        switch country {
        case .US:
            return US.getRatingValue(rating: rating)
        }
    }

    // MARK: ratingIsAllowed
    /// True if supplied rating is allowed per device settings
    public class func ratingIsAllowed(country: Country, rating: String) -> Bool {
        switch country {
        case .US:
            return US.ratingIsAllowed(rating: rating)
        }
    }
}
