//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by Andres Rivillas on 7/09/24.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        
        return dateFormatter.string(from: self)
    }
    
    
}
