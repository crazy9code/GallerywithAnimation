//
//  All.swift
//  MXPagerAnimation
//
//  Created by Kuliza-336 on 04/03/17.
//  Copyright © 2017 Kuliza-336. All rights reserved.
//

import UIKit

//protocol changeFirstVCDelegate: class {
//    func changeVC(toVC viewController: UIViewController)
//}

class All: UIViewController {

    @IBOutlet weak var allLabel: UILabel!
    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var screenshotView: UIView!
    @IBOutlet weak var whatsAppView: UIView!
    @IBOutlet weak var instagramView: UIView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        allLabel.layer.shadowColor = UIColor.brown.cgColor
        allLabel.layer.shadowOpacity = 5.0
        allLabel.layer.cornerRadius = 10.0
        allLabel.layer.masksToBounds = true
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let cameratap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapRecon))
        cameraView.isUserInteractionEnabled = true
        cameraView.addGestureRecognizer(cameratap)
        
        let screentap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapRecon1))
        screenshotView.isUserInteractionEnabled = true
        screenshotView.addGestureRecognizer(screentap)
        
        let whatApptap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapRecon2))
        whatsAppView.isUserInteractionEnabled = true
        whatsAppView.addGestureRecognizer(whatApptap)
        
        let instatap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapRecon3))
        instagramView.isUserInteractionEnabled = true
        instagramView.addGestureRecognizer(instatap)
        
    }

    func tapRecon()
    {
        let controller = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Camera")
        controller.modalTransitionStyle = .coverVertical
        self.present(controller, animated: true, completion: nil)
        
    }
    func tapRecon1()
    {
        let controller = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Screenshot")
        controller.modalTransitionStyle = .flipHorizontal
        self.present(controller, animated: true, completion: nil)
    }
    func tapRecon2()
    {
        let controller = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WhatsApp")
        controller.modalTransitionStyle = .crossDissolve
        self.present(controller, animated: true, completion: nil)
    }
    func tapRecon3()
    {
        let controller = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Instagram")
        controller.modalTransitionStyle = .partialCurl
        self.present(controller, animated: true, completion: nil)
    }

}
    
    //        temp2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Public") as? Public

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


