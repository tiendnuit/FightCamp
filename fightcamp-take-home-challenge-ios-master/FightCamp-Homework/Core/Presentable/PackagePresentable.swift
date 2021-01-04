//
//  PackagePresentable.swift
//  FightCamp-Homework
//
//  Created by Scor Doan on 04/01/2021.
//  Copyright © 2021 Alexandre Marcotte. All rights reserved.
//

import Foundation
protocol PackagePresentable {
    var titleLabelText: String {get}
    var descLabelText: String {get}
    var thumbsUrls: [URL] {get}
    var includedLabelText: String {get}
    var excludedLabelText: String {get}
    var paymentLabelText: String {get}
    var priceLabelText: String {get}
    var actionLabelText: String {get}
}
