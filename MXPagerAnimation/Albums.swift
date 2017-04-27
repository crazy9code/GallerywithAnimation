//
//  Albums.swift
//  MXPagerAnimation
//
//  Created by Kuliza-336 on 04/03/17.
//  Copyright © 2017 Kuliza-336. All rights reserved.
//

import UIKit

class Albums: UIViewController {

    @IBOutlet weak var listView: UIScrollView!
    var selectedImage: UIImageView?
    let images = [ UIImage(named: "hd1")!,
                   UIImage(named: "hd2")!,
                   UIImage(named: "hd3")!,
                   UIImage(named: "hd4")!,
                   UIImage(named: "hd5")!,
                   UIImage(named: "hd6")!,
                   UIImage(named: "hd7")!,
                   UIImage(named: "hd8")!,
                   UIImage(named: "hd9")!,
                   UIImage(named: "hd10")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if listView.subviews.count < images.count {
            listView.viewWithTag(0)?.tag = 1000 //prevent confusion when looking up images
            setupList()
        }
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func setupList() {
        
        for i in images.indices {
            
            //create image view
            let imageView = UIImageView(image: images[i])
            imageView.tag = i
            imageView.contentMode = .scaleAspectFill
            imageView.isUserInteractionEnabled = true
            imageView.layer.cornerRadius = 20.0
            imageView.layer.masksToBounds = true
            listView.addSubview(imageView)
            
            //attach tap detector
          //  imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapImageView)))
        }
        
        listView.backgroundColor = UIColor.clear
        positionListItems()
    }
    func positionListItems() {
        let listHeight = listView.frame.height
        let itemHeight: CGFloat = listHeight * 1.33
        let aspectRatio = UIScreen.main.bounds.height / UIScreen.main.bounds.width
        let itemWidth: CGFloat = itemHeight / aspectRatio
        
        let horizontalPadding: CGFloat = 10.0
        
        for i in images.indices {
            let imageView = listView.viewWithTag(i) as! UIImageView
            imageView.frame = CGRect(
                x: CGFloat(i) * itemWidth + CGFloat(i+1) * horizontalPadding, y: 0.0,
                width: itemWidth, height: itemHeight)
        }
        
        listView.contentSize = CGSize(
            width: CGFloat(images.count) * (itemWidth + horizontalPadding) + horizontalPadding,
            height:  0)
    }
//    func didTapImageView(_ tap: UITapGestureRecognizer) {
//        selectedImage = tap.view as? UIImageView
//        
//        let index = tap.view!.tag
//        let selectedHerb = images[index]
//        
//        //present details view controller
//        let herbDetails = storyboard!.instantiateViewController(withIdentifier: "HerbDetailsViewController") as! HerbDetailsViewController
//        herbDetails.herb = selectedHerb
//        present(herbDetails, animated: true, completion: nil)
//    }
    
}
