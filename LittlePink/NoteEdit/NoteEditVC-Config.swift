//
//  NoteEditVC-Config.swift
//  LittlePink
//
//  Created by HWB on 2022/6/3.
//

import Foundation

extension NoteEditVC{
    func  config(){
        photoCollectionView.dragInteractionEnabled = true //enable
        hideKeyboardWhenTappedAround()
        titleCountLabel.text = "\(kMaxNoteTitleCount)"
        
        // remove textView padding
        let lineFramentPadding = noteTextView.textContainer.lineFragmentPadding
        noteTextView.textContainerInset = UIEdgeInsets(top: 0, left: -lineFramentPadding, bottom: 0, right: -lineFramentPadding)
    }
}
