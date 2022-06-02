//
//  NoteEditVC.swift
//  LittlePink
//
//  Created by HWB on 2022/5/31.
//

import UIKit
import YPImagePicker
import SKPhotoBrowser

class NoteEditVC: UIViewController {

    var photos = [
        UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3")
    ]
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    var photoCount: Int { photos.count }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
extension NoteEditVC: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 1. create SKPhoto Array from UIImage
        var images: [SKPhoto] = []
        
        for photo in photos{
            images.append(SKPhoto.photoWithImage(photo!))
        }
        
        // 2. create PhotoBrowser Instance, and present from your viewController.
        let browser = SKPhotoBrowser(photos: images, initialPageIndex: indexPath.item)
        browser.delegate = self
        SKPhotoBrowserOptions.displayDeleteButton = true
        SKPhotoBrowserOptions.displayAction = false
        
        present(browser, animated: true, completion: {})
    }
}
// MARK: - SKPhotoBrowserDelegate
extension NoteEditVC: SKPhotoBrowserDelegate{
    func removePhoto(_ browser: SKPhotoBrowser, index: Int, reload: @escaping (() -> Void)) {
        photos.remove(at: index)
        photoCollectionView.reloadData()
        reload()
    }
}

extension NoteEditVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photoCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kPhotoCellID, for: indexPath) as! PhotoCell
        cell.imageView.image = photos[indexPath.item]
        
        cell.contentView.layer.cornerRadius = 10
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind{
        case UICollectionView.elementKindSectionFooter:
            let photoFooter = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kPhotoFooterID, for: indexPath) as! PhotoFooter
            
            // button tap event
            photoFooter.addPhotoButton.addTarget(self, action: #selector(addPhoto), for: .touchUpInside)
            return photoFooter
        default:
            fatalError("no header")
        }
    }
    
}

// MARK: - Listener
extension NoteEditVC{
    @objc private func addPhoto(){
        if photoCount < kMaxPhotoSelectedCount{
            
            var config = YPImagePickerConfiguration()
            
            // MARK: General configuration
            config.albumName = Bundle.main.appName
            config.screens = [.library]
            
            // MARK: Library configuration
            config.library.defaultMultipleSelection = true
            config.library.maxNumberOfItems = kMaxPhotoSelectedCount - photoCount
            config.library.spacingBetweenItems = kSpacingBetweenItems
            
            // MARK: Gallery configuration
            config.gallery.hidesRemoveButton = false
            
            let picker = YPImagePicker(configuration: config)
            
            picker.didFinishPicking { [unowned picker] items, _ in
                
                for item in items{
                    if case let .photo(photo) = item{
                        self.photos.append(photo.image)
                    }
                }
                self.photoCollectionView.reloadData()
                        
                picker.dismiss(animated: true)
            }
            present(picker, animated: true)
            
        } else {
            self.showTextHUD("Error", "you can only select \(kMaxPhotoSelectedCount) pictures at same time")
        }
    }
}

