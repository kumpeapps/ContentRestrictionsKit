# ContentRestrictionKit

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/efa8e1aa551f480fa451f59c12b8a279)](https://app.codacy.com/gh/kumpeapps/ContentRestrictionsKit?utm_source=github.com&utm_medium=referral&utm_content=kumpeapps/ContentRestrictionsKit&utm_campaign=Badge_Grade_Settings)
[![Version](https://img.shields.io/cocoapods/v/ContentRestrictionKit.svg?style=flat)](https://cocoapods.org/pods/ContentRestrictionKit)
[![Platform](https://img.shields.io/cocoapods/p/ContentRestrictionKit.svg?style=flat)](https://cocoapods.org/pods/ContentRestrictionKit)

## Features
-   Get Device's Movie Rating Restriction Setting (Raw Value or Text Value)
-   Get the raw value of a supplied Movie Rating (currently supports US ratings ONLY)
-   Determine if supplied Movie Rating is allowed by device restrictions (again, US ONLY)

### Movie Ratings

#### Get Device's Movie Rating Restriction Setting

```swift
ContentRestrictionKit.Movie.getDeviceRestrictionValue()
```
Returns Raw value of Movie Rating Restriction on Device (Int value 0-1000)

```swift
ContentRestrictionKit.Movie.getDeviceRestriction(country: .US)
```
Returns value of Movie Rating Restriction on Device (String value unrestricted, nc17, r, pg13, pg, g, disallow)

#### Get Movie Rating Value

```swift
ContentRestrictionKit.Movie.getRatingValue(country: .US, rating: "r") // 400
```
Returns raw value of supplied Movie Rating (Int value 0-1000)

#### Movie Rating is Allowed

```swift
ContentRestrictionKit.Movie.ratingIsAllowed(country: .US, rating: "r") // returns Bool
```
Returns true/false if supplied rating is allowed by device's movie restriction rating

## Installation

**ContentRestrictionKit** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ContentRestrictionKit'
```

## Features Planned

-   [ ] TV Show Ratings
-   [ ] App Ratings
-   [ ] Explicit Books Allowed
-   [ ] Explicit Music Podcasts Allowed

## Currently Supported Countries 
(feel free to send me info on new countries or contribute via pull request)

-   [X] United States (US)
