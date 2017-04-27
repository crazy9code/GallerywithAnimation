//
//  MxViewController.swift
//  MXPagerAnimation
//
//  Created by Indu Pal on 04/03/17.
//  Copyright © 2017 Kuliza-336. All rights reserved.
//

import UIKit
import MXSegmentedPager

class MxViewController: MXSegmentedPagerController {

    let mainScreen: CGRect = UIScreen.main.bounds
    enum selectVC: Int
    {
        case All = 0
        case Public = 1
        case Albums = 2
        case Groups = 3
    }
    
    var headerView: UIView!
    var flickrImage: UIImageView!
    var flickrImage1: UIImageView!
//    var controllerToPush: UIViewController?
    
    var AllView: All = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "All") as! All
    var PublicView: Public = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Public") as! Public
    var AlbumsView: Albums = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Albums") as! Albums
    var GroupsView: Groups = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Groups") as! Groups
    
    let PagerLabels : [String] = ["All", "Public", "Albums", "Groups"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // <---- Parallax Header ---->
        
        let headerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: mainScreen.width, height: (mainScreen.height/3)))
        
        // Defining the header image
        let headerImage: UIImageView = UIImageView.init(frame: CGRect(origin: headerView.frame.origin, size: headerView.frame.size))
        headerImage.image = UIImage(named: "viewcamera")
        headerView.insertSubview(headerImage, at: 0)
        
       
        flickrImage = UIImageView.init(frame: CGRect(x:140, y: 100, width: 50, height: 50))
        flickrImage.image = UIImage(named: "rotatecam")
        
        flickrImage1 = UIImageView.init(frame: CGRect(x: 190, y: 100, width: 50, height: 50))
        flickrImage1.image = UIImage(named: "rotate")
        
        headerImage.addSubview(flickrImage)
        headerImage.addSubview(flickrImage1)
        
        animateRotation()

        headerView.contentMode = UIViewContentMode.scaleAspectFill
        
        self.segmentedPager.parallaxHeader.view = headerView
        self.segmentedPager.parallaxHeader.mode = MXParallaxHeaderMode.fill
        self.segmentedPager.parallaxHeader.height = (mainScreen.height / 3)
        self.segmentedPager.parallaxHeader.minimumHeight = 20
        
       // self.segmentedPager.pager.alpha = 0.6
       // self.segmentedPager.bounces = true
        self.segmentedPager.backgroundColor = UIColor.white
       // self.segmentedPager.segmentedControlEdgeInsets.top = CGFloat(20)
        self.segmentedPager.segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocation.down
        self.segmentedPager.segmentedControl.backgroundColor = UIColor.init(white: 0.8, alpha: 0.8)
        self.segmentedPager.segmentedControl.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.brown]
        self.segmentedPager.segmentedControl.selectedTitleTextAttributes = [NSForegroundColorAttributeName : UIColor.brown]
        self.segmentedPager.segmentedControl.selectedTitleTextAttributes =
            [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 23.0)]
        self.segmentedPager.segmentedControl.selectionStyle = HMSegmentedControlSelectionStyle.textWidthStripe
        self.segmentedPager.segmentedControl.selectionIndicatorColor = UIColor.brown
        self.segmentedPager.segmentedControl.selectionIndicatorHeight = CGFloat(3.0)
        
    }
  
    func animateRotation()
    {
        UIView.animate(withDuration: 1.0,  animations: {
          //  self.flickrImage.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
            self.flickrImage.transform = CGAffineTransform(translationX: 50, y: 0)
          //  self.flickrImage1.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
            self.flickrImage1.transform = CGAffineTransform(translationX: 50 * (-1) , y: 0)
        }, completion: { finished in
            UIView.animate(withDuration: 0.0, animations: {
//          self.flickrImage.transform = CGAffineTransform.identity
//          self.flickrImage1.transform = CGAffineTransform.identity
            self.flickrImage.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.flickrImage1.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            }, completion: { finished in
                UIView.animate(withDuration: 1.0, animations: {
               // self.segmentedPager.segmentedControl.transform = CGAffineTransform(translationX: 0, y: 20)
                }, completion: { finished in
              //  self.segmentedPager.segmentedControl.transform = CGAffineTransform.identity
                })
            })
            self.animateRotation()
        })
    }
    
    override func segmentedPager(_ segmentedPager: MXSegmentedPager, titleForSectionAt index: Int) -> String {
        return ["All", "Public", "Albums", "Groups"][index]
    }
    
    override func numberOfPages(in segmentedPager: MXSegmentedPager) -> Int {
        return PagerLabels.count
    }
    
    override func segmentedPager(_ segmentedPager: MXSegmentedPager, viewControllerForPageAt index: Int) -> UIViewController
    {
        if let trial = selectVC.init(rawValue: index)
        {
            switch trial
            {
            case .All:
                return AllView
                
            case .Public:
                return PublicView
                
            case .Albums:
                return AlbumsView
                
            case .Groups:
                return GroupsView
            }
        }
        else
        {
            return AllView
        }
    }

}
