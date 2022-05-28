//
//  DiscoveryVC.swift
//  LittlePink
//
//  Created by HWB on 2022/5/28.
//

import UIKit
import XLPagerTabStrip

class DiscoveryVC: ButtonBarPagerTabStripViewController, IndicatorInfoProvider {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        IndicatorInfo(title: "Discovery")
    }
    
}
