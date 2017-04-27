//
//  Public.swift
//  MXPagerAnimation
//
//  Created by Kuliza-336 on 04/03/17.
//  Copyright © 2017 Kuliza-336. All rights reserved.
//

import UIKit

class Public: UIViewController {

    @IBOutlet weak var publicLabel: UILabel!
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
    
//    let temp3 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Albums") as! Album
    
 //   var completionHandler: ((UIViewController) -> (Void))?
    
    @IBOutlet weak var urlImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        publicLabel.layer.cornerRadius = 15.0
        publicLabel.layer.masksToBounds = true
       // publicLabel.layer.borderWidth = 5.0
       // publicLabel.layer.borderColor = UIColor.brown.cgColor
        publicLabel.layer.shadowColor = UIColor.black.cgColor
        publicLabel.layer.shadowOpacity = 1.0
        publicLabel.layer.shadowRadius = 10.0
        
        urlImageView.layer.cornerRadius = 20.0
        urlImageView.layer.masksToBounds = true
        urlImageView.layer.borderWidth = 5.0
        urlImageView.layer.borderColor = UIColor.brown.cgColor
        urlImageView.layer.shadowColor = UIColor.brown.cgColor
        urlImageView.layer.shadowOpacity = 10.0
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        urlImageView.animationImages = images
        urlImageView.animationDuration = 10
        urlImageView.animationRepeatCount = 1000
        urlImageView.startAnimating()
    }
}

