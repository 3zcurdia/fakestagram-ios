//
//  Account.swift
//  fakestagram
//
//  Created by LuisE on 3/17/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import Foundation
import UIKit

struct Account: Codable {
    let id: String? = nil
    let name: String
    let deviceNumber: String
    let deviceModel: String
    
    static func initialize() -> Account {
        return Account(
            name: Names.load().generate(),
            deviceNumber: UIDevice.identifier,
            deviceModel: UIDevice.modelName
        )
    }
}
