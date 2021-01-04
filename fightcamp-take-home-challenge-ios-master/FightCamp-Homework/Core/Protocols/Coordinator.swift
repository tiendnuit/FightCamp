//
//  Coordinator.swift
//  FightCamp-Homework
//
//  Created by Scor Doan on 04/01/2021.
//  Copyright © 2021 Alexandre Marcotte. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}
