//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Nonato Sousa on 09/10/23.
//

import Foundation

extension Bundle{
    
    //Generics
    func decode<T: Codable>(_ file: String) -> T{
        //1. Locate the json file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        //2. Create a property to the data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Faile to load \(file) from bundle")
        }
        
        //3. Create a decoder
        let decoder = JSONDecoder()
        
        //4. Create a property to the decoded data
        guard let result = try? decoder.decode(T.self, from: data) else {
            fatalError("Faile to decode \(file) from bundle.")
        }
        
        //5. Return the ready to use data
        return result
    }
}
