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
        // Set simulator rating to 400 (R)
        UserDefaults.standard.set(400, forKey: "com.apple.content-rating.MovieRating")
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
        XCTAssertEqual(ContentRestrictionsKit.Movie.ratingIsAllowed(country: .US, rating: "r"), true)
        XCTAssertEqual(ContentRestrictionsKit.Movie.ratingIsAllowed(country: .US, rating: "nc17"), false)
    }

}
