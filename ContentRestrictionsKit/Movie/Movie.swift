//
//  Movie.swift
//  ContentRestrictionsKit
//
//  Created by Justin Kumpe on 12/8/20.
//

import Foundation

public class Movie {

    // MARK: getDeviceRestrctionValue
    /// Gets Device's movie restriction setting as raw value
    public class func getDeviceRestrictionValue() -> Int {
        let movieRestrictionSetting = UserDefaults.standard.object(forKey: "com.apple.content-rating.MovieRating") as? Int ?? 1000
        return movieRestrictionSetting
    }

    // MARK: getDeviceRestrictionName
    /// Gets Device's movie restriction setting as name using supplied country's rating system
    public class func getDeviceRestrictionName(country: Country) -> String {
        switch country {
        case .US:
            return US.getDeviceRestrictionName()
        }
    }

    // MARK: getRatingValue
    /// Get iOS raw value of movie rating
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
