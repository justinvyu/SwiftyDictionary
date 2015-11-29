# SwiftyDictionary

[![CI Status](http://img.shields.io/travis/Justin Yu/SwiftyDictionary.svg?style=flat)](https://travis-ci.org/Justin Yu/SwiftyDictionary)
[![Version](https://img.shields.io/cocoapods/v/SwiftyDictionary.svg?style=flat)](http://cocoapods.org/pods/SwiftyDictionary)
[![License](https://img.shields.io/cocoapods/l/SwiftyDictionary.svg?style=flat)](http://cocoapods.org/pods/SwiftyDictionary)
[![Platform](https://img.shields.io/cocoapods/p/SwiftyDictionary.svg?style=flat)](http://cocoapods.org/pods/SwiftyDictionary)

## Usage

This pod should be used with the Dictionary API found at
[API Link](dictionaryapi.com).

To run the example project, clone the repo, and run `pod install` from the
Example directory first.

## Requirements

This pod depends on Alamofire.

## Installation

SwiftyDictionary is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SwiftyDictionary"
```

## Quickstart

The basic features of this pod are the Dictionary and Thesaurus classes.

### Dictionary

Not finished...

### Thesaurus

To instantiate a thesaurus, all you need to do is provide an API key.

```swift
let thesaurus = Thesaurus(key: "YOUR-API-KEY")
```

To find synonyms, simply provide a word and a callback that handles the result.

```swift
let thesaurus = Thesaurus(key: "YOUR-API-KEY")

thesaurus.fetchSynonyms("big") { results in
    // Display results, an array of synonyms for the word "big"
    for result in results {
        print(result)
    }
}
```

You can also set a limit on the number of results you receive.

```swift
thesaurus.fetchSynonyms("big", limit: 5) { results in
    ...
}
```

If you want to separate the synonyms by the different definitions of the word,
use the `fetchSynonymsWithSeparation` method.

```swift
thesaurus.fetchSynonymsWithSeparation("big") { results in
    // Display results: an array containing arrays of synonym string, separated by
    // the different definitions of the word "big"
    for result in results {
        print(result)
    }
}
```

## Todo

- [ ] Dictionary
    - [ ] Get definitions (array of all possible definitions)
    - [ ] Get part of speech as an array for different definitions
    - [ ] Get a sample sentence
- [x] Thesaurus (more features later)
    - [x] Get all synonyms (regardless of different definitions)
    - [x] Get all synonyms as an array of arrays of synonyms (accounting for different definitions)

## Author

Justin Yu, justin.v.yu@gmail.com

## License

SwiftyDictionary is available under the MIT license. See the LICENSE file for more info.
