//
//  JSONDecoder+Extensions.swift
//  Cookable
//
//  Created by Kody Deda on 4/6/21.
//

import Foundation

extension JSONDecoder {
  func load<T>(_ type: T.Type, from url: URL) -> Result<T, Error> where T: Codable {
    do {
      let decoded = try JSONDecoder().decode(type.self, from: Data(contentsOf: url))
      return .success(decoded)
    }
    catch {
      return .failure(error)
    }
  }
}
