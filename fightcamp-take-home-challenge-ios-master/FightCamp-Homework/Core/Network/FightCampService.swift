//
//  FightCampService.swift
//  FightCamp-Homework
//
//  Created by Scor Doan on 04/01/2021.
//  Copyright © 2021 Alexandre Marcotte. All rights reserved.
//

import Foundation
protocol FightCampError: Error {
}

class FightCampService: FightCampServiceable {
    func getPackages(_ complete: @escaping ([Package], FightCampError?) -> ()) {
        // Use a dispatch queue that schedules tasks for concurrent execution.
        DispatchQueue.global().async {
            // Initialize the json decoder
            let decoder = JSONDecoder()
            
            // Load data from a local file containing json
            let path = Bundle.main.path(forResource: "packages", ofType: "json")!
            let data = try! Data(contentsOf: URL(fileURLWithPath: path))
                        
            // Decode data
            let packages = try! decoder.decode([Package].self, from: data)
            complete(packages, nil)
            
        }
    }
    
    
}
