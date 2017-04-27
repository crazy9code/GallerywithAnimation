//
//  ViewController.swift
//  MXPagerAnimation
//
//  Created by Kuliza-336 on 04/03/17.
//  Copyright © 2017 Kuliza-336. All rights reserved.
//

import UIKit

class Login: UIViewController {
        
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var bubble1: UIImageView!
    @IBOutlet weak var bubble2: UIImageView!
    @IBOutlet weak var bubble3: UIImageView!
    
    // Custom UI
    let spinner = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    let warningMessage = UIImageView(image: UIImage(named: "Warning"))
    var loginPosition = CGPoint.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bubble1.transform = CGAffineTransform(scaleX: 0, y: 0)
        self.bubble2.transform = CGAffineTransform(scaleX: 0, y: 0)
        self.bubble3.transform = CGAffineTransform(scaleX: 0, y: 0)

        self.loginLabel.center.x -= self.view.bounds.width
        
        let paddingViewForUsername = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: self.username.frame.height))
        self.username.leftView = paddingViewForUsername
        self.username.leftViewMode = .always
        
        let paddingViewForPassword = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: self.password.frame.height))
        self.password.leftView = paddingViewForPassword
        self.password.leftViewMode = .always
        
        let userImageView = UIImageView(image: UIImage(named: "User"))
        userImageView.frame.origin = CGPoint(x: 13, y: 10)
        self.username.addSubview(userImageView)
        
        let passwordImageView = UIImageView(image: UIImage(named: "Key"))
        passwordImageView.frame.origin = CGPoint(x: 12, y: 9)
        self.password.addSubview(passwordImageView)
        
        self.username.center.x -= self.view.bounds.width
        self.password.center.x -= self.view.bounds.width
        
        self.loginPosition = self.login.center
        self.login.center.x -= self.view.bounds.width
        
        self.view.addSubview(self.warningMessage)
        self.warningMessage.isHidden = true
        self.warningMessage.center = self.loginPosition
        
        login.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func spin() {
        UIView.animate(withDuration: 10, delay: 0.5, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
            self.bubble1.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.bubble2.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.bubble3.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: {(finished) -> Void in
            self.spin()
        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         self.spin()
        username.alpha = 0.8
        password.alpha = 0.8
        login.alpha = 0.5
        
        UIView.animate(withDuration: 1.5, delay: 0.5, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.loginLabel.center.x += self.view.bounds.width
        }, completion: nil)
        
        
        UIView.animate(withDuration: 1.5, delay: 0.6, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.username.center.x += self.view.bounds.width
        }, completion: nil)
        
        UIView.animate(withDuration: 1.5, delay: 0.7, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.password.center.x += self.view.bounds.width
        }, completion: nil)
        
        UIView.animate(withDuration: 1.5, delay: 0.8, options: .curveEaseOut, animations: {
            self.login.center.x += self.view.bounds.width
        }, completion: nil)
        
    }
    
    
    func loginTapped(sender: Any) {
        self.login.addSubview(self.spinner)
        self.spinner.frame.origin = CGPoint(x: 12, y: 12)
        self.spinner.startAnimating()
        login.alpha = 1
        UIView.transition(with: self.warningMessage,
                          duration: 1.0,
                          options: .transitionFlipFromTop,
                          animations: {
                            self.warningMessage.isHidden = true
        }, completion: nil)
        
        UIView.animate(withDuration: 1.5, animations: {
            self.login.center = self.loginPosition
        }, completion: { _ in
            self.login.center.x -= 30
            UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: [], animations: {
                self.login.center.x += 30
            }, completion: {finished in
                UIView.animate(withDuration: 0.3, animations: {
                    self.login.center.y += 90
                    self.spinner.removeFromSuperview()
                }, completion: { _ in
                    UIView.transition(with: self.warningMessage,
                                      duration: 1.0,
                                      options: [.transitionFlipFromTop, .curveEaseOut],
                                      animations: {
                                        self.warningMessage.isHidden = false
                    }, completion: nil)
                })
            })
        })
    }
    

}

