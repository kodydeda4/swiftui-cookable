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
