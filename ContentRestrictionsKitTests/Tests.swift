//
//  Tests.swift
//  ContentRestrictionsKitTests
//
//  Created by Justin Kumpe on 12/8/20.
//

import XCTest
import ContentRestrictionsKit

class Tests: XCTestCase {

    override func setUpWithError() throws {
        // Set simulator Movie rating to 400 (R)
        UserDefaults.standard.set(400, forKey: "com.apple.content-rating.MovieRating")
        // Set simulator TV Show rating to 400 (TV-PG)
        UserDefaults.standard.set(400, forKey: "com.apple.content-rating.TVShowRating")
        // Set simulator Explicit Books Allowed to 0 (False)
        UserDefaults.standard.set(0, forKey: "com.apple.content-rating.ExplicitBooksAllowed")
        // Set simulator Explicit Music Podcasts Allowed to 0 (False)
        UserDefaults.standard.set(0, forKey: "com.apple.content-rating.ExplicitMusicPodcasts")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetDeviceMovieRestrictionValue() {
        XCTAssertEqual(ContentRestrictionsKit.Movie.getDeviceRestrictionValue(), 400)
    }

    func testGetDeviceMovieRestriction() {
        XCTAssertEqual(ContentRestrictionsKit.Movie.getDeviceRestrictionName(country: .US), "r")
        XCTAssertNotEqual(ContentRestrictionsKit.Movie.getDeviceRestrictionName(country: .US), "pg")
    }

    func testGetMovieRatingValue() {
        XCTAssertEqual(ContentRestrictionsKit.Movie.getRatingValue(country: .US, rating: "r"), 400)
        XCTAssertEqual(ContentRestrictionsKit.Movie.getRatingValue(country: .US, rating: "pg"), 200)
        XCTAssertEqual(ContentRestrictionsKit.Movie.getRatingValue(country: .US, rating: "g"), 100)
        XCTAssertNotEqual(ContentRestrictionsKit.Movie.getRatingValue(country: .US, rating: "r"), 100)
        XCTAssertNotEqual(ContentRestrictionsKit.Movie.getRatingValue(country: .US, rating: "pg"), 400)
        XCTAssertNotEqual(ContentRestrictionsKit.Movie.getRatingValue(country: .US, rating: "g"), 200)
    }

    func testMovieRatingIsAllowed() {
        XCTAssertEqual(ContentRestrictionsKit.Movie.ratingIsAllowed(country: .US, rating: "g"), true)
        XCTAssertEqual(ContentRestrictionsKit.Movie.ratingIsAllowed(country: .US, rating: "pg"), true)
        XCTAssertEqual(ContentRestrictionsKit.Movie.ratingIsAllowed(country: .US, rating: "pg13"), true)
        XCTAssertEqual(ContentRestrictionsKit.Movie.ratingIsAllowed(country: .US, rating: "PG-13"), true)
        XCTAssertEqual(ContentRestrictionsKit.Movie.ratingIsAllowed(country: .US, rating: "r"), true)
        XCTAssertEqual(ContentRestrictionsKit.Movie.ratingIsAllowed(country: .US, rating: "nc17"), false)
    }

    func testGetDeviceTVRestrictionValue() {
        XCTAssertEqual(ContentRestrictionsKit.TVShow.getDeviceRestrictionValue(), 400)
    }

    func testGetDeviceTVRestriction() {
        XCTAssertEqual(ContentRestrictionsKit.TVShow.getDeviceRestrictionName(country: .US), "tvpg")
        XCTAssertNotEqual(ContentRestrictionsKit.TVShow.getDeviceRestrictionName(country: .US), "tvg")
    }

    func testGetTVRatingValue() {
        XCTAssertEqual(ContentRestrictionsKit.TVShow.getRatingValue(country: .US, rating: "tvpg"), 400)
        XCTAssertEqual(ContentRestrictionsKit.TVShow.getRatingValue(country: .US, rating: "TV-PG"), 400)
        XCTAssertEqual(ContentRestrictionsKit.TVShow.getRatingValue(country: .US, rating: "tvy7"), 200)
        XCTAssertEqual(ContentRestrictionsKit.TVShow.getRatingValue(country: .US, rating: "tvy"), 100)
        XCTAssertNotEqual(ContentRestrictionsKit.TVShow.getRatingValue(country: .US, rating: "tvma"), 100)
        XCTAssertNotEqual(ContentRestrictionsKit.TVShow.getRatingValue(country: .US, rating: "tvg"), 400)
        XCTAssertNotEqual(ContentRestrictionsKit.TVShow.getRatingValue(country: .US, rating: "tv14"), 200)
    }

    func testTVRatingIsAllowed() {
        XCTAssertEqual(ContentRestrictionsKit.TVShow.ratingIsAllowed(country: .US, rating: "tvy"), true)
        XCTAssertEqual(ContentRestrictionsKit.TVShow.ratingIsAllowed(country: .US, rating: "tvy7"), true)
        XCTAssertEqual(ContentRestrictionsKit.TVShow.ratingIsAllowed(country: .US, rating: "tvpg"), true)
        XCTAssertEqual(ContentRestrictionsKit.TVShow.ratingIsAllowed(country: .US, rating: "TV-PG"), true)
        XCTAssertEqual(ContentRestrictionsKit.TVShow.ratingIsAllowed(country: .US, rating: "tv14"), false)
        XCTAssertEqual(ContentRestrictionsKit.TVShow.ratingIsAllowed(country: .US, rating: "tvma"), false)
    }

    func testExplicitMusicAllowed() {
        XCTAssertEqual(ContentRestrictionsKit.Explicit.isExplicitMusicAllowed(), false)
    }

    func testExplicitBooksAllowed() {
        XCTAssertEqual(ContentRestrictionsKit.Explicit.isExplicitBooksAllowed(), false)
    }
}
