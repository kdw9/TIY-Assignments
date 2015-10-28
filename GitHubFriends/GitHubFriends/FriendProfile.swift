//
//  FriendProfile.swift
//  GitHubFriends
//
//  Created by Keron Williams on 10/27/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation


struct FriendProfile
{
    let name: String
    let email: String
    let avatar_url: String
    let login: String
    
    init(name: String, email: String, avatar_url: String, login: String)
    {
        self.name = name
        self.email = email
        self.avatar_url = avatar_url
        self.login = login
    }
    
}