//
//  Movie+US.swift
//  ContentRestrictionsKit
//
//  Created by Justin Kumpe on 12/8/20.
//

import Foundation

extension Movie {
    public class US {
        /// Gets Device's movie restriction setting as name (US)
        public class func getDeviceRestrictionName() -> String {
            let movieRestrictionSetting = Movie.getDeviceRestrictionValue()
            switch movieRestrictionSetting {
            case 1000:
                return "unrestricted"
            case 500:
                return "nc17"
            case 400:
                return "r"
            case 300:
                return "pg13"
            case 200:
                return "pg"
            case 100:
                return "g"
            case 0:
                return "disallow"
            default:
                return "unknown"
            }
        }

        /// Get iOS raw value of movie rating (US)
        public class func getRatingValue(rating: String) -> Int {
            let movieRating = rating.lowercased()
            let cleanedMovieRating = movieRating.replacingOccurrences(of: "-", with: "")
            switch cleanedMovieRating {
            case "g":
                return 100
            case "pg":
                return 200
            case "pg13":
                return 300
            case "r":
                return 400
            case "nc17":
                return 500
            default:
                return 1000
            }
        }

        /// True if supplied rating is allowed per device settings
        public class func ratingIsAllowed(rating: String) -> Bool {
            let ratingRawValue = getRatingValue(rating: rating)
            let allowedRatingRawValue = Movie.getDeviceRestrictionValue()
            return allowedRatingRawValue >= ratingRawValue
        }

    }
}
