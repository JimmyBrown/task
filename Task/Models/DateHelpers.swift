//
//  DateHelpers.swift
//  Task
//
//  Created by Jimmy Brown on 4/22/20.
//  Copyright © 2020 Jimmy Brown. All rights reserved.
//

import UIKit

extension Date {
    
    func stringValue() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        return formatter.string(from: self)
    }
}
