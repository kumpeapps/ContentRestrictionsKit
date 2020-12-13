# ContentRestrictionsKit

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/efa8e1aa551f480fa451f59c12b8a279)](https://app.codacy.com/gh/kumpeapps/ContentRestrictionsKit?utm_source=github.com&utm_medium=referral&utm_content=kumpeapps/ContentRestrictionsKit&utm_campaign=Badge_Grade_Settings)
[![Version](https://img.shields.io/cocoapods/v/ContentRestrictionsKit.svg?style=flat)](https://cocoapods.org/pods/ContentRestrictionsKit)
[![Platform](https://img.shields.io/cocoapods/p/ContentRestrictionsKit.svg?style=flat)](https://cocoapods.org/pods/ContentRestrictionsKit)

## Features
-   Get Device's Movie Rating Restriction Setting (Raw Value or Text Value)
-   Get the raw value of a supplied Movie Rating (currently supports US ratings ONLY)
-   Determine if supplied Movie Rating is allowed by device restrictions (again, US ONLY)

### Movie Ratings

#### Get Device's Movie Rating Restrictions Setting

```swift
ContentRestrictionsKit.Movie.getDeviceRestrictionValue()
```
Returns Raw value of Movie Rating Restriction on Device (Int value 0-1000)

```swift
ContentRestrictionsKit.Movie.getDeviceRestriction(country: .US)
```
Returns Name value of Movie Rating Restriction on Device

#### Get Movie Rating Value

```swift
ContentRestrictionsKit.Movie.getRatingValue(country: .US, rating: "r") // 400
```
Returns raw value of supplied Movie Rating (Int value 0-1000)

#### Movie Rating is Allowed

```swift
ContentRestrictionsKit.Movie.ratingIsAllowed(country: .US, rating: "r") // returns Bool
```
Returns true/false if supplied rating is allowed by device's movie restriction rating

### TV Show Ratings

#### Get Device's TV Show Rating Restrictions Setting

```swift
ContentRestrictionsKit.TVShow.getDeviceRestrictionValue()
```
Returns Raw value of TV Show Rating Restriction on Device (Int value 0-1000)

```swift
ContentRestrictionsKit.TVShow.getDeviceRestriction(country: .US)
```
Returns Name value of TV Show Rating Restriction on Device

#### Get TV Show Rating Value

```swift
ContentRestrictionsKit.TVShow.getRatingValue(country: .US, rating: "tvpg") // 400
```
Returns raw value of supplied TV Show Rating (Int value 0-1000)

#### TV Show Rating is Allowed

```swift
ContentRestrictionsKit.TVShow.ratingIsAllowed(country: .US, rating: "tvpg") // returns Bool
```
Returns true/false if supplied rating is allowed by device's TV Show restriction rating

### App Ratings

#### Get Device's App Rating Restrictions Setting

```swift
ContentRestrictionsKit.App.getDeviceRestrictionValue()
```
Returns Raw value of App Rating Restriction on Device (Int value 0-1000)

```swift
ContentRestrictionsKit.App.getDeviceRestriction()
```
Returns Name value of App Rating Restriction on Device

#### Get App Rating Value

```swift
ContentRestrictionsKit.App.getRatingValue(rating: "12+") // 300
```
Returns raw value of supplied App Rating (Int value 0-1000)

#### App Rating is Allowed

```swift
ContentRestrictionsKit.App.ratingIsAllowed(rating: "12+") // returns Bool
```
Returns true/false if supplied rating is allowed by device's App restriction rating

### Explicit Restrictions

#### Explicit Music Allowed

```swift
ContentRestrictionsKit.Explicit.isExplicitMusicAllowed() // returns Bool
```
Returns true/false if Explicit Music, Podcasts, & News are allowed on the device

#### Explicit Books Allowed

```swift
ContentRestrictionsKit.Explicit.isExplicitBooksAllowed() // returns Bool
```
Returns true/false if Explicit Books are allowed on the device

## Installation

**ContentRestrictionsKit** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ContentRestrictionsKit'
```

## Features Planned

-   [X] TV Show Ratings
-   [X] App Ratings
-   [X] Explicit Books Allowed
-   [X] Explicit Music Podcasts Allowed
-   [ ] Game Ratings (Mapped to closest App Rating)

## Currently Supported Countries 
(feel free to send me info on new countries, request new countries via issue or contribute via pull request. Gathering info for specific countries is very time consuming so additional countries will only be added upon request.)

-   [X] United States (US)
