//
//  Screenshot.swift
//  MXPagerAnimation
//
//  Created by Kuliza-336 on 06/03/17.
//  Copyright © 2017 Kuliza-336. All rights reserved.
//

import UIKit

class Screenshot: UIViewController {

    @IBOutlet weak var screenshotCollectionView: UICollectionView!
    
    var imgAry = [UIImage(named: "hill2"),UIImage(named: "ooty"),UIImage(named: "tajmahal"),UIImage(named: "image1"),UIImage(named: "image2"),UIImage(named: "image3"),UIImage(named: "image4"),UIImage(named: "image5"),UIImage(named: "image6"),UIImage(named: "hill1"),UIImage(named: "myshore")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        screenshotCollectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        
        screenshotCollectionView.delegate = self
        screenshotCollectionView.dataSource = self
        screenshotCollectionView.bounces = false
        screenshotCollectionView.showsVerticalScrollIndicator = false
        screenshotCollectionView.allowsSelection = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButton(_ sender: Any) {
         self.dismiss(animated: true, completion: nil)
    }

}
extension Screenshot: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return imgAry.count
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        let image = imgAry[indexPath.row]
        cell.ImageCell.image = image
        return cell
    }
}

