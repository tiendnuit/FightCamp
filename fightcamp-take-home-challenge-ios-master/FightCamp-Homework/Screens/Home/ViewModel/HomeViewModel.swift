//
//  HomeViewModel.swift
//  FightCamp-Homework
//
//  Created by Scor Doan on 04/01/2021.
//  Copyright © 2021 Alexandre Marcotte. All rights reserved.
//

import Foundation
import Combine


enum ViewModelState {
    case stop
    case loading
    case error(Error)
}

class HomeViewModel {
    @Published private(set) var packages: [PackagePresentable] = []
    @Published private(set) var state: ViewModelState = .stop

    private let apiService: FightCampServiceable

    init(apiService: FightCampServiceable = FightCampService()) {
        self.apiService = apiService
    }

    //MARK: - Private functions
    private func reset() {
        state = .stop
        packages = []
    }

    //MARK: - Public functions
    func fetchPackages() {
        state = .loading
        apiService.getPackages { (packages, error) in
            DispatchQueue.main.async { [weak self] in
                self?.state = .stop
                self?.packages = packages
            }
        }
    }
}


extension HomeViewModel: ListPackagesProtocol {
    var items: [PackagePresentable] {
        return packages
    }
}
