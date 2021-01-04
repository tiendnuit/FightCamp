//
//  ListPackagesProtocol.swift
//  FightCamp-Homework
//
//  Created by Scor Doan on 04/01/2021.
//  Copyright © 2021 Alexandre Marcotte. All rights reserved.
//

import Foundation
protocol ListPackagesProtocol: class {
    var items: [PackagePresentable] { get }
    func numberOfItems() -> Int
    func item(at indexPath: IndexPath) -> PackagePresentable?
    func itemSelected(at: IndexPath)
}

extension ListPackagesProtocol {
    func numberOfItems() -> Int {
        return items.count
    }
    
    
    func item(at indexPath: IndexPath) -> PackagePresentable? {
        guard indexPath.row < items.count else { return nil }
        return items[indexPath.row]
    }
    
    func itemSelected(at: IndexPath) {
        guard let item = item(at: at) else { return }
        //TODO: goto detail page
    }
}
