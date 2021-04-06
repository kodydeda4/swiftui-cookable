//
//  String+Extensions.swift
//  Cookable
//
//  Created by Kody Deda on 4/6/21.
//

import Foundation

extension String {
    var seperateUppercaseCharacters: String {
        let regex = try! NSRegularExpression(pattern: "([a-z]*)([A-Z])") //<-Use capturing, `([a-z]*)`->$1, `([A-Z])`->$2
        return regex.stringByReplacingMatches(
            in: self, range: NSRange(0..<self.utf16.count),
            withTemplate: "$1 $2"
        )
        .trimmingCharacters(in: .whitespacesAndNewlines)
        .components(separatedBy: " ")
        .joined(separator: " ")
    }
}
