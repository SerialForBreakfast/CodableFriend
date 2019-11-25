//
//  Friend.swift
//  CodableFriend
//
//  Created by Joseph McCraw on 11/25/19.
//  Copyright © 2019 Joseph McCraw. All rights reserved.
//

import Foundation

struct Friend: Codable {
    var id: UUID
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Connection]
}

