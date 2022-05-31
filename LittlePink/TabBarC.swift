//
//  TabBarC.swift
//  LittlePink
//
//  Created by HWB on 2022/5/29.
//

import UIKit
import YPImagePicker

class TabBarC: UITabBarController, UITabBarControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        delegate = self
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        if viewController is PostVC{
            
            // wait todo login
            
            var config = YPImagePickerConfiguration()
            
            // MARK: General configuration
            config.isScrollToChangeModesEnabled = false
            config.onlySquareImagesFromCamera = false
            config.albumName = Bundle.main.appName
            config.startOnScreen = YPPickerScreen.library
            config.screens = [.library, .photo, .video]
            config.preferredStatusBarStyle = UIStatusBarStyle.default
            config.maxCameraZoomFactor = kMaxCameraZoomFactor
            
            // logical
            // 1. can not select photo with video same time -> unselected type will be inactive
            // 2. if mutiplselected video -> will be mixed to one video
            // 3. can be added lately after taking photo or video
            // MARK: Library configuration
            config.library.mediaType = YPlibraryMediaType.photoAndVideo
            config.library.defaultMultipleSelection = true
            config.library.maxNumberOfItems = kMaxPhotoSelectedCount
            config.library.spacingBetweenItems = kSpacingBetweenItems
            
            // MARK: Video configuration
            config.video.recordingTimeLimit = 60.0
            config.video.libraryTimeLimit = 60.0
            config.video.minimumTimeLimit = 3.0
            config.video.trimmerMaxDuration = 60.0
            config.video.trimmerMinDuration = 3.0
            
            // MARK: Gallery configuration
            config.gallery.hidesRemoveButton = false
            
            let picker = YPImagePicker(configuration: config)
            
            picker.didFinishPicking { [unowned picker] items, cancelled in
                if cancelled{
                    print("Picker was canceled")
                }
                for item in items {
                    switch item {
                    case .photo(let photo):
                        print(photo)
                    case .video(let video):
                        print(video)
                    }
                }
                picker.dismiss(animated: true, completion: nil)
            }
            present(picker, animated: true, completion: nil)
            
            return false
        }
        return true
    }
}

