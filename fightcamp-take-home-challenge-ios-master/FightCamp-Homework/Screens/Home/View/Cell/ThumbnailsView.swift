//
//  ThumbnailsView.swift
//  FightCamp-Homework
//
//  Created by Scor Doan on 04/01/2021.
//  Copyright © 2021 Alexandre Marcotte. All rights reserved.
//

import Foundation
import UIKit

/// View with large image view and small thumbnails
class ThumbnailsView: UIView {
    private var numsOfItem = 4
    private var selectedIndex = 0
    private var thumbnailViews: [UIImageView] = []
    //Selected imageview
    var mainImageView: UIImageView! = {
        let imageView = UIImageView()
        imageView.backgroundColor = .disabledLabel
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = CGFloat.thumbnailRadius
        imageView.clipsToBounds = true
        return imageView
    }()
    
    //Stackview
    let containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = CGFloat.thumbnailSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //Stackview
    let thumbnailsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = CGFloat.thumbnailSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initSetup()
    }
    
    init(numsOfItem: Int = 4) {
        super.init(frame: .zero)
        self.numsOfItem = numsOfItem
        initSetup()
    }
    
    private func initSetup() {
        for i in 1...numsOfItem {
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(thumbnailTapped(_:)))
            let imageView = UIImageView()
            imageView.backgroundColor = .disabledLabel
            imageView.contentMode = .scaleAspectFill
            imageView.layer.cornerRadius = CGFloat.thumbnailRadius
            imageView.clipsToBounds = true
            imageView.tag = i
            imageView.layer.borderWidth = CGFloat.thumbnailBorderWidth
            imageView.layer.borderColor = UIColor.thumbnailBorder(selected: false).cgColor
            imageView.isUserInteractionEnabled = true
            imageView.addGestureRecognizer(tapGestureRecognizer)
            thumbnailViews.append(imageView)
            thumbnailsStackView.addArrangedSubview(imageView)
        }
        
        containerStackView.addArrangedSubview(mainImageView)
        containerStackView.addArrangedSubview(thumbnailsStackView)
        self.addSubview(containerStackView)
        
        
        let firstImage = thumbnailViews.first!
        //Update constraints
        NSLayoutConstraint.activate([
            //Main imageview
            mainImageView.heightAnchor.constraint(equalToConstant: CGFloat.thumbnailHeight),
            firstImage.heightAnchor.constraint(equalTo: firstImage.widthAnchor),
            
            //thumbnailsStackView button
            containerStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            containerStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerStackView.topAnchor.constraint(equalTo: self.topAnchor),
        ])
    }
    
    private func reset() {
        selectedIndex = 0
        thumbnailViews.forEach{$0.image = nil}
    }
    
    func loadThumbnailUrls(_ urls: [URL]) {
        reset()
        guard !urls.isEmpty else { return }
        mainImageView.imageFromURL(url: urls.first!)
        for (i, thumbView) in thumbnailViews.enumerated() {
            thumbView.imageFromURL(url: urls[i])
        }
        selectedThumbnail(0)
    }
    
    ///Handle tap action on thumbnail
    @objc func thumbnailTapped(_ recognizer: UITapGestureRecognizer) {
        guard let tappedImage = recognizer.view as? UIImageView else {
            return
        }
        selectedThumbnail(tappedImage.tag-1)
    }
    
    private func selectedThumbnail(_ index: Int) {
        selectedIndex = index
        for (i, thumbView) in thumbnailViews.enumerated() {
            thumbView.layer.borderColor = UIColor.thumbnailBorder(selected: i == index).cgColor
            if i == index {
                mainImageView.image = thumbView.image
            }
        }
    }
}
