//
//  Camera.swift
//  MXPagerAnimation
//
//  Created by Kuliza-336 on 06/03/17.
//  Copyright © 2017 Kuliza-336. All rights reserved.
//

import UIKit

class Camera: UIViewController {

    @IBOutlet weak var cameraCollectionView: UICollectionView!

        var imgAry = [UIImage(named: "hill2"),UIImage(named: "ooty"),UIImage(named: "tajmahal"),UIImage(named: "image1"),UIImage(named: "image2"),UIImage(named: "image3"),UIImage(named: "image4"),UIImage(named: "image5"),UIImage(named: "image6"),UIImage(named: "hill1"),UIImage(named: "myshore")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cameraCollectionView.layer.shadowColor = UIColor.brown.cgColor
        cameraCollectionView.layer.shadowOpacity = 8.0
        cameraCollectionView.backgroundColor = UIColor.init(hue: 0.6, saturation: 0.4, brightness: 0.2, alpha: 0.4)
        cameraCollectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        
        cameraCollectionView.delegate = self
        cameraCollectionView.dataSource = self
        
        cameraCollectionView.bounces = false
        cameraCollectionView.showsVerticalScrollIndicator = false
        cameraCollectionView.allowsSelection = false
        // Do any additional setup after loading the view.
    }

    @IBAction func backbutton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
extension Camera: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
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
