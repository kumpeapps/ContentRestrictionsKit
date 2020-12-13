//
//  App.swift
//  ContentRestrictionsKit
//
//  Created by Justin Kumpe on 12/12/20.
//

import Foundation

public class App {

    // MARK: getDeviceRestrictionValue
    /// Gets Device's app restriction setting as raw value
    public class func getDeviceRestrictionValue() -> Int {
        let movieRestrictionSetting = UserDefaults.standard.object(forKey: "com.apple.content-rating.AppRating") as? Int ?? 1000
        return movieRestrictionSetting
    }

    // MARK: getDeviceRestrictionName
    /// Gets Device's app restriction setting as name using supplied country's rating system
    public class func getDeviceRestrictionName() -> String {
        let restrictionValue = getDeviceRestrictionValue()
        switch restrictionValue {
        case 0:
            return "disallow"
        case 100:
            return "4+"
        case 200:
            return "9+"
        case 300:
            return "12+"
        case 600:
            return "17+"
        case 1000:
            return "unrestricted"
        default:
            return "unknown"
        }
    }

    // MARK: getRatingValue
    /// Get iOS raw value of app rating
    public class func getRatingValue(rating: String) -> Int {
        let cleanedRating = rating.replacingOccurrences(of: "+", with: "")
        switch cleanedRating {
        case "disallow":
            return 0
        case "4":
            return 100
        case "9":
            return 200
        case "12":
            return 300
        case "17":
            return 600
        case "unrestricted":
            return 1000
        default:
            return 1000
        }
    }

    // MARK: ratingIsAllowed
    /// True if supplied rating is allowed per device settings
    public class func ratingIsAllowed(rating: String) -> Bool {
        let ratingRawValue = getRatingValue(rating: rating)
        let allowedRatingRawValue = getDeviceRestrictionValue()
        return allowedRatingRawValue >= ratingRawValue
    }
}
