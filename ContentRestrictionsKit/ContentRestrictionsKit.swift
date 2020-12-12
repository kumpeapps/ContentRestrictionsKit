//
//  ContentRestrictionsKit.swift
//  ContentRestrictionsKit
//
//  Created by Justin Kumpe on 12/8/20.
//

import Foundation

// MARK: Deprecated Functions
/// Gets Device's movie restriction setting as raw value
@available(iOS, deprecated: 14.0, renamed: "Movie.getDeviceRestrictionValue()")
public func getDeviceMovieRestrictionRaw() -> Int {
    return Movie.getDeviceRestrictionValue()
}

/// Gets Device's movie restriction setting as name (US)
@available(iOS, deprecated: 14.0, renamed: "Movie.getDeviceRestrictionName(country:)")
public func getDeviceMovieRestriction() -> String {
    return Movie.getDeviceRestrictionName(country: .US)
}

/// Get iOS raw value of movie rating (US)
@available(iOS, deprecated: 14.0, renamed: "Movie.getRatingValue(country:rating:)")
public func getMovieRatingValue(rating: String) -> Int {
    return Movie.getRatingValue(country: .US, rating: rating)
}

/// True if supplied rating is allowed per device settings (US)
@available(iOS, deprecated: 14.0, renamed: "Movie.ratingIsAllowed(country:rating:)")
public func movieRatingIsAllowed(rating: String) -> Bool {
    return Movie.ratingIsAllowed(country: .US, rating: rating)
}
