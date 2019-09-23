//
//  User.swift
//  Battleground
//
//  Created by Stas Kirichok on 01-06-2019.
//  Copyright © 2019 Stas Kirichok. All rights reserved.
//

import Foundation

enum Gender: String {
    case male
    case female
}

class User: Codable {

    let id: String
    let name: String
    private let createdUnixDate: TimeInterval
    private var genderString: String

    var gender: Gender {
        get {
            return Gender(rawValue: genderString)!
        }
        set {
            genderString = newValue.rawValue
        }
    }

}
