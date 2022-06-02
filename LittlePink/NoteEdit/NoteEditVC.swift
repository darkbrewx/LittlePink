//
//  NoteEditVC.swift
//  LittlePink
//
//  Created by HWB on 2022/5/31.
//

import UIKit


class NoteEditVC: UIViewController {

    var photos = [
        UIImage(named: "1")!, UIImage(named: "2")!, UIImage(named: "3")!
    ]
    
    // var videoURL: URL? = Bundle.main.url(forResource: "testVideo", withExtension: "mp4")!
    var videoURL: URL?
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var titleCountLabel: UILabel!
    @IBOutlet weak var noteTextView: UITextView!
    
    
    var photoCount: Int { photos.count }
    var isVideo: Bool { videoURL != nil }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoCollectionView.dragInteractionEnabled = true
        hideKeyboardWhenTappedAround()
    }
    
    @IBAction func TFEditBegin(_ sender: Any) {
        titleCountLabel.isHidden = false
    }
    
    @IBAction func TFEditEnd(_ sender: Any) {
        titleCountLabel.isHidden = true
    }
    
    @IBAction func TFEndOnExit(_ sender: Any) {}
    
    @IBAction func TFEditChanged(_ sender: Any) {
        titleCountLabel.text = "\(kMaxNoteTitleCount - titleTextField.unwrappedText.count)"
    }
    
    
}
extension NoteEditVC: UITextFieldDelegate{

}

