//
//  Validator.swift
//  Validator
//
//  Created by Keron Williams on 10/14/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class Validator
{
    func validateName(name: String) -> Bool
    {
        if name.componentsSeparatedByString(" ").count == 2
        {
            return true
        }
        else
        {
        
            return false
        }
    }
    func validateAddress(address: String) -> Bool
    {
        return true
    }
    func validateCity(city: String) -> Bool
    {
        return true
    }
    func validateState(state: String) -> Bool
    {
        if state.characters.count == 2
        {
         return true
        }
        else
        {
         return false
        }

    }
    func validateZipCode(zipCode: String) -> Bool
    {
        let charaterSet = NSCharacterSet(charactersInString: "0123456789")
        if zipCode.characters.count == 5 && zipCode.rangeOfCharacterFromSet(charaterSet)?.count == 0
        {
           return true
        }
        else
        {
        return false
        }
    }
    func validatePhoneNumber(phoneNumber: String) -> Bool
    {
        return true
    }
    
    func containsLettersOnly(string: String) -> Bool
    {
        let allCharacters = "abcdefghijklmnopqrstuvwxyz"
        let lowerCase = string.lowercaseString
        for c in lowerCase.characters
        {
            if !allCharacters.characters.contains(c)
            {
                return false
            }
        }
        return true
    }



    
}