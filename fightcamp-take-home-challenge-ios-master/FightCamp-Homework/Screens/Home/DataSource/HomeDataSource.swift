//
//  HomeDataSource.swift
//  FightCamp-Homework
//
//  Created by Scor Doan on 04/01/2021.
//  Copyright © 2021 Alexandre Marcotte. All rights reserved.
//

import Foundation
import UIKit

class HomeDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    weak var delegate: ListPackagesProtocol?
    
    init(delegate: ListPackagesProtocol) {
        self.delegate = delegate
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate?.numberOfItems() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = delegate?.item(at: indexPath) else {
            fatalError("Item not exists")
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PackageTableViewCell.defaultIdentifier, for: indexPath) as? PackageTableViewCell else {
            fatalError("Cell not exists")
        }
        cell.selectionStyle = .none
        cell.configure(item: item)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.itemSelected(at: indexPath)
    }
}
