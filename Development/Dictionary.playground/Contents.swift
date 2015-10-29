//: Playground - noun: a place where people can play

import UIKit

var countries = ["US": "United States","CA": "Canada", "BE": "Belgium"]

countries["CA"]

countries["BRZ"] = "Brazil"
countries

countries["US"] = "United States of America"

countries

let item = countries.removeValueForKey("BRZ")
item

countries["AF"] = "Africa"

countries ["CA"] = "Oh Canada"

countries

countries.removeValueForKey("CA")

countries
