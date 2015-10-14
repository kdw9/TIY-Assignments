//
//  Money.swift
//  Jack Pot
//
//  Created by Keron Williams on 10/13/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation


class MoneyTicket
{
 var ticketNumbers = Array <Int> ()
    
    init()
    {
        for _ in 1...6
        {
        
        generateAndAdd()
            
        }
    }
func generateAndAdd()
{
    var pickFound = false
    repeat
    {
        let aPick = Int(arc4random() % 53 + 1)
        if !ticketNumbers.contains(aPick)
        {
        ticketNumbers.append(aPick)
        pickFound = true
            
        }
    } while !pickFound
    
    }
    
    
}
