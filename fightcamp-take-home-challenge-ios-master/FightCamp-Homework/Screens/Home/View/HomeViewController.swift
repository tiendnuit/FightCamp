//
//  HomeViewController.swift
//  FightCamp-Homework
//
//  Created by Scor Doan on 04/01/2021.
//  Copyright © 2021 Alexandre Marcotte. All rights reserved.
//

import Foundation
import UIKit
import Combine

class HomeViewController: UIViewController, UIViewControllerConfigurable {
    var tableView: UITableView!
    
    var viewModel: HomeViewModel!
    private var dataSource: HomeDataSource!
    private var bindings = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupComponents()
        constraintsInit()
        bindViewModel()
        updateUI()
    }
    
    func setupComponents() {
        //UI components
        view.backgroundColor = UIColor.secondaryBackground
        tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        //viewModel = HomeViewModel()
        dataSource = HomeDataSource(delegate: viewModel)
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        tableView.register(PackageTableViewCell.self, forCellReuseIdentifier: PackageTableViewCell.defaultIdentifier)
        
    }
    
    func constraintsInit() {
        //tableview constraints
        NSLayoutConstraint.activate([
            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
            
        ])
    }
    
    func bindViewModel() {
        func bindViewModelToView() {
            let reloadTableHandler: ([Any]) -> Void = { [weak self] _ in
                self?.tableView.reloadData()
            }

            viewModel.$packages
                .receive(on: RunLoop.main)
                .sink(receiveValue: reloadTableHandler)
                .store(in: &bindings)

            let stateHandler: (ViewModelState) -> Void = { state in
                switch state {
                case .loading:
                    print("loading....")
                case .stop:
                    print("stop....")
                case .error(let error):
                    print("error....\(error)")
                }
            }

            viewModel.$state
                .receive(on: RunLoop.main)
                .sink(receiveValue: stateHandler)
                .store(in: &bindings)
        }

        bindViewModelToView()
        viewModel.fetchPackages()
    }
    
    func updateUI() {
    }
    
}
