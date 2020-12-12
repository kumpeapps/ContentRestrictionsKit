//
//  TVShow+US.swift
//  ContentRestrictionsKit
//
//  Created by Justin Kumpe on 12/12/20.
//

import Foundation

extension TVShow {
    public class US {
        /// Gets Device's TV Show restriction setting as name (US)
        public class func getDeviceRestrictionName() -> String {
            let tvShowRestrictionSetting = getDeviceRestrictionValue()
            switch tvShowRestrictionSetting {
            case 1000:
                return "unrestricted"
            case 600:
                return "tvma"
            case 500:
                return "tv14"
            case 400:
                return "tvpg"
            case 300:
                return "tvg"
            case 200:
                return "tvy7"
            case 100:
                return "tvy"
            case 0:
                return "disallow"
            default:
                return "unknown"
            }
        }

        /// Get iOS raw value of TV Show rating (US)
        public class func getRatingValue(rating: String) -> Int {
            let tvShowRating = rating.lowercased()
            let cleanedTvShowRating = tvShowRating.replacingOccurrences(of: "-", with: "")
            switch cleanedTvShowRating {
            case "tvy":
                return 100
            case "tvy7":
                return 200
            case "tvg":
                return 300
            case "tvpg":
                return 400
            case "tv14":
                return 500
            case "tvma":
                return 600
            default:
                return 1000
            }
        }

        /// True if supplied rating is allowed per device settings
        public class func ratingIsAllowed(rating: String) -> Bool {
            let ratingRawValue = getRatingValue(rating: rating)
            let allowedRatingRawValue = TVShow.getDeviceRestrictionValue()
            return allowedRatingRawValue >= ratingRawValue
        }

    }
}
