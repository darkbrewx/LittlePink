//
//  HomeVC.swift
//  LittlePink
//
//  Created by HWB on 2022/5/28.
//

import UIKit
import XLPagerTabStrip

class HomeVC: ButtonBarPagerTabStripViewController {
    
    override func viewDidLoad() {
        
        // MARK: ButtonBar Customization
        
        // SelectedBar(line under the item) Customization
        settings.style.selectedBarBackgroundColor = UIColor(named: "main")!
        settings.style.selectedBarHeight = 3
        
        // ButtonBarItem Customization
        settings.style.buttonBarItemBackgroundColor = .clear
        settings.style.buttonBarItemFont = .systemFont(ofSize: 16)
        
        super.viewDidLoad()
        
        // eliminate bounces
        containerView.bounces = false
        
        // change buttonBarItemTitleColor when selected
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }

            oldCell?.label.textColor = .secondaryLabel
            newCell?.label.textColor = .label
        }
    }
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let followVC = storyboard!.instantiateViewController(withIdentifier: kFollowVCID)
        let nearbyVC = storyboard!.instantiateViewController(withIdentifier: kNearbyVCID)
        let discoveryVC = storyboard!.instantiateViewController(withIdentifier: kDiscoveryVCID)
        
        return[followVC, nearbyVC, discoveryVC]
    }

}
