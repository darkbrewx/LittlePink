//
//  PhotoFooter.swift
//  LittlePink
//
//  Created by HWB on 2022/6/2.
//

import UIKit

class PhotoFooter: UICollectionReusableView {
    @IBOutlet weak var addPhotoButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addPhotoButton.layer.borderWidth = 1
        addPhotoButton.layer.borderColor = UIColor.quaternaryLabel.cgColor
        addPhotoButton.layer.cornerRadius = 10
    }
}
