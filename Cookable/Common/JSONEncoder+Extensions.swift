//
//  JSONEncoder+Extensions.swift
//  Cookable
//
//  Created by Kody Deda on 4/6/21.
//

import Foundation

extension JSONEncoder {
  func write<T>(_ type: T, to url: URL) -> Result<Bool, Error> where T: Codable {
    let startDate = Date()
    
    print("writeState: to: '\(url)'")
    do {
      try JSONEncoder()
        .encode(type)
        .write(to: url)
      
      print("\(Date()) elapsed: '\(startDate.timeIntervalSinceNow * -1000) ms'")
      return .success(true)
    } catch {
      return .failure(error)
    }
  }
}
