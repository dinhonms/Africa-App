//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Nonato Sousa on 09/10/23.
//

import Foundation

extension Bundle{
    
    func decode(_ file: String) -> [CoverImageModel]{
        //1. Locate the json file
        guard let url = self.url(forResource: file, withExtension: "json") else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        //2. Create a property to the data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Faile to load \(file) from bundle")
        }
        
        //3. Create a decoder
        let decoder = JSONDecoder()
        
        //4. Create a property to the decoded data
        guard let result = try? decoder.decode([CoverImageModel].self, from: data) else {
            fatalError("Faile to decode \(file) from bundle.")
        }
        
        //5. Return the ready to use data
        return result
    }
}
