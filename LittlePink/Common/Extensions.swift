//
//  Extensions.swift
//  LittlePink
//
//  Created by HWB on 2022/5/30.
//

import Foundation
import UIKit

extension UIView{
    @IBInspectable
    var radius: CGFloat{
        get{
            layer.cornerRadius
        }
        set{
            self.layer.cornerRadius = newValue
        }
    }
}

extension UIViewController{
    func showTextHUD(_ title: String, _ subTitle: String? = nil){
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .text  //will be ActivityIndicator without mode
        hud.label.text = title
        hud.detailsLabel.text = subTitle
        hud.hide(animated: true, afterDelay: 2) //auto hide
    }
}

extension Bundle{
    var appName: String{
        if let appName = localizedInfoDictionary?["CFBundleDisplayName"] as? String{
            return appName
        } else {
            return infoDictionary!["CFBundleDisplayName"] as! String
        }
    }
}

