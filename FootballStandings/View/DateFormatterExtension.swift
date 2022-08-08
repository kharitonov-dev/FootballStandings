//
//  DateFormatterExtension.swift
//  FootballStandings
//
//  Created by Timofey Kharitonov on 08.08.2022.
//

import Foundation

extension DateFormatter {
    public static func getDateFromString(date: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.date(from: date)
    }
    
    public static func getStringFromDate(date: Date) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter.string(from: date)
    }
}
