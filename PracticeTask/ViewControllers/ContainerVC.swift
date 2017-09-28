//
//  ViewController.swift
//  PracticeTask
//
//  Created by appinventiv on 27/09/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class ContainerVC: UIViewController {
    
    // Outlet for side menu......................
    @IBOutlet weak var sideMenu: UIView!
    
    // Outlet for Container......................
    @IBOutlet weak var containerView: UIView!
    
    // View Methods......................
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // observer For toogle side menu......................
        NotificationCenter.default.addObserver(forName: NSNotification.Name("toggleSideMenuShow"), object: nil, queue: OperationQueue.main, using: {(notification) in
            print("called")
            
            UIView.animate(withDuration:0.8, delay: 0.2,usingSpringWithDamping: 0.7, initialSpringVelocity: 0.6,options: .curveEaseInOut,
                           animations:{
                            
                            self.sideMenu.transform = CGAffineTransform(translationX:225, y: 1)
                            self.containerView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                            
            }){(true) in
                
                print("animation")
                
            }
            
        })
        
        // observer to hide side menu......................
        NotificationCenter.default.addObserver(forName: NSNotification.Name("toggleSideMenuHide"), object: nil, queue: OperationQueue.main, using: {(notification) in
            print("called")
            UIView.animate(withDuration: 0.6, animations: {
                
                self.sideMenu.transform = CGAffineTransform(translationX:-225, y: 1)
                self.containerView.transform = CGAffineTransform(scaleX: 1, y: 1)
                
            })
            
        })
    }
}

