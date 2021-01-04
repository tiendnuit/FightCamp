//
//  ViewReusable.swift
//  FightCamp-Homework
//
//  Created by Scor Doan on 04/01/2021.
//  Copyright © 2021 Alexandre Marcotte. All rights reserved.
//

import Foundation
import UIKit

protocol ViewReusable: class {
    static var defaultIdentifier: String { get }
}

extension ViewReusable where Self: UIView {
    static var defaultIdentifier: String {
        return NSStringFromClass(self)
    }
}

extension UITableViewCell: ViewReusable {
}
