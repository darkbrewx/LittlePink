//
//  Extensions.swift
//  LittlePink
//
//  Created by HWB on 2022/5/30.
//

import Foundation

extension Bundle{
    var appName: String{
        if let appName = localizedInfoDictionary?["CFBundleDisplayName"] as? String{
            return appName
        } else {
            return infoDictionary!["CFBundleDisplayName"] as! String
        }
    }
}
