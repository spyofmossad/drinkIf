//
//  DataManager.swift
//  DrinkIf
//
//  Created by Dmitry on 11.06.2020.
//  Copyright © 2020 Dmitry Navitski. All rights reserved.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    private init() {}
    
    func getQuestions(withName name: String) -> [String]? {
        if  let path = Bundle.main.path(forResource: name, ofType: "plist"),
            let xml = FileManager.default.contents(atPath: path)
        {
            return (try? PropertyListSerialization
                .propertyList(from: xml, options: .mutableContainersAndLeaves, format: nil)) as? [String]
        }

        return nil
    }
}
