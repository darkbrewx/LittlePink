//
//  NoteEditVC-Config.swift
//  LittlePink
//
//  Created by HWB on 2022/6/3.
//

import Foundation
import UIKit

extension NoteEditVC{
    func  config(){
        photoCollectionView.dragInteractionEnabled = true //enable
        hideKeyboardWhenTappedAround()
        titleCountLabel.text = "\(kMaxNoteTitleCount)"
        
        // remove textView padding
        let lineFramentPadding = noteTextView.textContainer.lineFragmentPadding
        noteTextView.textContainerInset = UIEdgeInsets(top: 0, left: -lineFramentPadding, bottom: 0, right: -lineFramentPadding)
        
        let paragraphStyle = NSMutableParagraphStyle()

        paragraphStyle.lineSpacing = 6
        
        let typingAttributes: [NSAttributedString.Key: Any] = [
            .paragraphStyle: paragraphStyle,
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor.secondaryLabel
        ]
        noteTextView.typingAttributes = typingAttributes
        
        noteTextView.tintColorDidChange()
    }
}
