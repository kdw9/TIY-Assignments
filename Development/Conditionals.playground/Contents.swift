//: Playground - noun: a place where people can play

import UIKit

let cards = 1...13

for card in cards {
    switch card {
    case 11:
        println("Jack")
    default:
        println(card)
    }
}

