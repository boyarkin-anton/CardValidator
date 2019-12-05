//
//  Data+Extension.swift
//  
//
//  Created by Anton Boyarkin on 05/12/2019.
//

import Foundation

extension Data {
    func to<Type: Codable>(_ type: Type.Type) -> Type? {
        do {
            let data = try JSONDecoder().decode(type, from: self)
            return data
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
