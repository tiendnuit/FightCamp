//
//  Configurable.swift
//  FightCamp-Homework
//
//  Created by Scor Doan on 04/01/2021.
//  Copyright © 2021 Alexandre Marcotte. All rights reserved.
//

import Foundation
protocol Configurable {
    func configure(item: Any)
}

protocol UIViewControllerConfigurable {
    func setupComponents()
    func bindViewModel()
    func updateUI()
}
