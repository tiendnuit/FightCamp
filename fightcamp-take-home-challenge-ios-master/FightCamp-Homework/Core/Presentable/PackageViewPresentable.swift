//
//  PackageViewPresentable.swift
//  FightCamp-Homework
//
//  Created by Scor Doan on 04/01/2021.
//  Copyright © 2021 Alexandre Marcotte. All rights reserved.
//

import Foundation
import UIKit

protocol PackageViewPresentable {
    var titleLabel: UILabel! {set get}
    var descLabel: UILabel! {set get}
    var thumbnailsView: ThumbnailsView! {set get}
    var optionsLabel: UILabel! {set get}
    var paymentLabel: UILabel! {set get}
    var priceLabel: UILabel! {set get}
    var viewButton: UIButton! {set get}
}

extension PackageViewPresentable {
    func map(item: PackagePresentable?) {
        guard let item = item else { return }
        titleLabel.text = item.titleLabelText.uppercased()
        descLabel.text = item.descLabelText.capitalized
        descLabel.setLineSpacing(lineHeightMultiple: CGFloat.lineHeightMultiple)
        paymentLabel.text = item.paymentLabelText.capitalized
        priceLabel.text = item.priceLabelText
        viewButton.setTitle(item.actionLabelText.capitalized, for: .normal)
        thumbnailsView.loadThumbnailUrls(item.thumbsUrls)
        
        //optionsLabel
        let optionsStr = item.includedLabelText.capitalized + "\n" + item.excludedLabelText.capitalized
        let attrStr = NSMutableAttributedString(string: optionsStr)
        //Included part
        let includedAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.label,
                                                                 .font: UIFont.body]
        let includedRange = (optionsStr as NSString).range(of: item.includedLabelText.capitalized)
        attrStr.addAttributes(includedAttributes, range: includedRange)
        
        //Excluded part
        let excludedAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.disabledLabel,
                                                                 .font: UIFont.body, .strikethroughStyle: 2]
        let excludedRange = (optionsStr as NSString).range(of: item.excludedLabelText.capitalized)
        attrStr.addAttributes(excludedAttributes, range: excludedRange)
        
        //Setup paragraph
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = CGFloat.lineHeightMultiple
        attrStr.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: optionsStr.count))
        
        optionsLabel.attributedText = attrStr
    }
}
