//
//  Milliseconds+Date.swift
//  The Hitchhiker Prophecy
//
//  Created by Fady Ramzy on 4/7/21.
//  Copyright © 2021 SWVL. All rights reserved.
//

import Foundation

extension Date {
    var millisecondsSince1970:Int64 {
        return Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }
}
