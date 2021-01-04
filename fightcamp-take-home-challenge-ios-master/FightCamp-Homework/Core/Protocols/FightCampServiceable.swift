//
//  FightCampServiceable.swift
//  FightCamp-Homework
//
//  Created by Scor Doan on 04/01/2021.
//  Copyright © 2021 Alexandre Marcotte. All rights reserved.
//

import Foundation
// Define a protocol containing the signature of a function to fetch data
protocol FightCampServiceable: AnyObject {
    func getPackages(_ complete: @escaping (_ Package: [Package], _ error: FightCampError?) -> ())
}
