//
//  Date+Extensions.swift
//  RawG
//
//  Created by Burak Oner on 15.11.2021.
//

import Foundation

extension Date {

    enum DateFormat: String {
        case dashed = "YYYY-MM-dd"
    }
    static func createDate(from referanceDate: Date = .now,
                           byAdding: Calendar.Component, value: Int) -> Date {
        Calendar.current.date(byAdding: byAdding, value: value, to: referanceDate) ?? .now
    }

    func format(by format: DateFormat) -> String {
        let dateFormatter: DateFormatter = .init()
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter.string(from: self)
    }
}


