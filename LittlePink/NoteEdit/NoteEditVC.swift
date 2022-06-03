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
    var textViewIAView: TextViewIAView{ noteTextView.inputAccessoryView as! TextViewIAView }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    @IBAction func TFEditBegin(_ sender: Any) {
        titleCountLabel.isHidden = false
    }
    
    @IBAction func TFEditEnd(_ sender: Any) {
        titleCountLabel.isHidden = true
    }
    
    @IBAction func TFEndOnExit(_ sender: Any) {}
    
    @IBAction func TFEditChanged(_ sender: Any) {
        // don't count highlight text
        guard titleTextField.markedTextRange == nil else {return}
        if titleTextField.unwrappedText.count > kMaxNoteTitleCount{
            titleTextField.text = String(titleTextField.unwrappedText.prefix(kMaxNoteTitleCount))
            
            DispatchQueue.main.async {
                //change the caret position when paste
                let end = self.titleTextField.endOfDocument
                self.titleTextField.selectedTextRange = self.titleTextField.textRange(from: end, to: end)
            }
        }
        
        titleCountLabel.text = "\(kMaxNoteTitleCount - titleTextField.unwrappedText.count)"
    }
    
    // wait to do : word count check before post
}
extension NoteEditVC: UITextViewDelegate{
    func textViewDidChange(_ textView: UITextView) {
        
        guard textView.markedTextRange == nil else{ return }
        textViewIAView.currentTextCount = textView.text.count
    }
}



//extension NoteEditVC: UITextFieldDelegate{
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//
//        let isExceed = range.location >= kMaxNoteTitleCount || (textField.unwrappedText.count + string.count) > kMaxNoteTitleCount
//        if isExceed{
//            showTextHUD("Oops!", "title can not be longer than \(kMaxNoteTitleCount) characters ")
//        }
//
//        return !isExceed
//    }
//}

