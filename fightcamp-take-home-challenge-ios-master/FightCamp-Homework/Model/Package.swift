//
//  Package.swift
//  FightCamp-Homework
//
//  Created by Scor Doan on 04/01/2021.
//  Copyright © 2021 Alexandre Marcotte. All rights reserved.
//

import Foundation
struct Package: Codable, Identifiable {
    var id = UUID()
    
    let title: String
    let desc: String
    var thumbnailUrls: [String] = []
    var included: [String] = []
    var excluded: [String]?
    let payment: String
    let price: Int
    let action: String
    
    public enum CodingKeys: String, CodingKey {
        case title, desc, included, excluded, payment, price, action
        case thumbnailUrls = "thumbnail_urls"
    }
}

//MARK: - PackagePresentable
extension Package: PackagePresentable {
    var titleLabelText: String {
        return title
    }
    
    var descLabelText: String {
        return desc
    }
    
    var thumbsUrls: [URL] {
        return thumbnailUrls.compactMap{ URL(string: $0)}
    }
    
    var includedLabelText: String {
        return included.joined(separator: "\n")
    }
    
    var excludedLabelText: String {
        return excluded?.joined(separator: "\n") ?? ""
    }
    
    var paymentLabelText: String {
        return payment
    }
    
    var priceLabelText: String {
        return "$\(price)"
    }
    
    var actionLabelText: String {
        return action
    }
    
    
}
