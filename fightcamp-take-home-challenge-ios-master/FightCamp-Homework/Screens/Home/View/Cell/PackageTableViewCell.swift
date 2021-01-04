//
//  PackageTableViewCell.swift
//  FightCamp-Homework
//
//  Created by Scor Doan on 04/01/2021.
//  Copyright © 2021 Alexandre Marcotte. All rights reserved.
//

import Foundation
import UIKit

class PackageTableViewCell: UITableViewCell, Configurable, PackageViewPresentable {
    //Title
    var titleLabel: UILabel! = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.title
        label.textColor = .brandRed
        return label
    }()
    
    //Description
    var descLabel: UILabel! = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.font = .body
        label.numberOfLines = 0
        return label
    }()
    
    //Selected imageview
    var thumbnailsView: ThumbnailsView! = {
        ThumbnailsView()
    }()
    
    //Included and Excluded
    var optionsLabel: UILabel! = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //Payment
    var paymentLabel: UILabel! = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.font = .body
        return label
    }()
    
    //Price
    var priceLabel: UILabel! = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.font = .price
        return label
    }()
    
    //View package button
    var viewButton: UIButton! = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .buttonBackground
        button.setTitleColor(.buttonTitle, for: .normal)
        button.titleLabel?.font = .button
        button.layer.cornerRadius = CGFloat.buttonRadius
        return button
    }()
    
    //Payment and price container stack view
    let paymentStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = CGFloat.paymentSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //Stackview
    let containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = CGFloat.packageSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //Container
    let containerView:UIView = {
        let view = UIView()
        view.backgroundColor = .primaryBackground
        view.layer.cornerRadius = CGFloat.packageRadius
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initSetup()
    }
    
    private func initSetup() {
        
        self.backgroundColor = .clear
        containerStackView.addArrangedSubview(titleLabel)
        containerStackView.addArrangedSubview(descLabel)
        containerStackView.addArrangedSubview(thumbnailsView)
        containerStackView.addArrangedSubview(optionsLabel)
        paymentStackView.addArrangedSubview(paymentLabel)
        paymentStackView.addArrangedSubview(priceLabel)
        containerStackView.addArrangedSubview(paymentStackView)
        containerStackView.addArrangedSubview(viewButton)
        containerView.addSubview(containerStackView)
        self.contentView.addSubview(containerView)
        self.contentView.backgroundColor = .clear
   
        //Update constraints
        NSLayoutConstraint.activate([
            //containerView
            containerView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: CGFloat.packageSpacing),
            containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -CGFloat.packageSpacing),
            
            //containerStackView
            containerStackView.centerXAnchor.constraint(equalTo: self.containerView.centerXAnchor),
            containerStackView.centerYAnchor.constraint(equalTo: self.containerView.centerYAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: CGFloat.packageSpacing),
            containerStackView.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: CGFloat.packageSpacing),
            
            //View button
            viewButton.heightAnchor.constraint(equalToConstant: CGFloat.buttonHeight)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure(item: Any) {
        guard let item = item as? PackagePresentable else { return }
        map(item: item)
    }
}

