//
//  ViewController.swift
//  Demo Prog
//
//  Created by Nikhi on 04/08/20.
//  Copyright © 2020 nikhit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let demoButton: UIButton =  {
        let button = UIButton()
        button.setTitle("Demo Button", for: .normal)
        button.backgroundColor = .link
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return button
    }()
    
    let loginButton: UIButton =  {
        let button = UIButton()
        button.setTitle("Login Button", for: .normal)
        button.backgroundColor = .link
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        super .viewWillLayoutSubviews()
        demoButton.frame = CGRect(x: 0, y: 0, width: view.frame.width - 60, height: 52)
        demoButton.center = view.center
        loginButton.frame = CGRect(x: demoButton.frame.origin.x,
                                   y: demoButton.frame.origin.y + demoButton.frame.height + 20,
                                   width: view.frame.width - 60,
                                   height: 52)
        view.addSubview(demoButton)
        view.addSubview(loginButton)
    }
    
    
}

