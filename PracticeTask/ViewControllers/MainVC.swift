//
//  MainVC.swift
//  PracticeTask
//
//  Created by appinventiv on 27/09/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit


class MainVC: UIViewController {
    
    // Variable declaration......................
    var islist = false
    var arr = ["Plumber", "Teacher", "Driver", "Waiter", "Painter"]
    var subArr = ["PKS Exports pvt Ltd", "PKS international school", "PKS Taxi service pvt Ltd", "PKS Restaurant", "PKS Service pvt "]
    
    // Outlets Declaraton.................................
    @IBOutlet weak var collectionViewOutlet: UICollectionView!
    
    @IBOutlet weak var viewTop: UIView!
    
    @IBOutlet weak var btnImage: UIImageView!
    
    // Action for Button..................
    @IBAction func buttonTap(_ sender: UIButton) {
        print("tapped main")
        NotificationCenter.default.post(name: NSNotification.Name("toggleSideMenuShow"), object: nil, userInfo: nil)
        
    }
    
    // List View Button..................
    @IBAction func listViewBtnTap(_ sender: UIButton) {
        islist = !islist
        
        UIView.transition(with: self.collectionViewOutlet,
                          duration: 0.35,
                          options: .transitionCrossDissolve,
                          animations: { self.collectionViewOutlet.reloadData() })
        
        if self.islist == false{
            
            self.btnImage.image = UIImage(named: "table")
        }
        else{
            
            self.btnImage.image = UIImage(named: "grid")
        }
        
    }
    
    // View Methods....................
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellNib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionViewOutlet.register(cellNib, forCellWithReuseIdentifier: "CollectionViewCellId")
        
        collectionViewOutlet.delegate = self
        collectionViewOutlet.dataSource = self
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        NotificationCenter.default.post(name: NSNotification.Name("toggleSideMenuHide"), object: nil, userInfo: nil)
    }
}

// Extnsion for MainVC Class...................
extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCellId", for: indexPath) as? CollectionViewCell else {
            fatalError()
        }
        cell.dataLabel.text = arr[indexPath.row]
        cell.subLabel.text = subArr[indexPath.row]
        
        if islist{
            
            UIView.animate(withDuration: 0.000001, delay: 0, options: .curveLinear
                , animations: {
                    
                    cell.dataLabel.transform = CGAffineTransform(translationX: -120, y: 0)
                    cell.subLabel.transform = CGAffineTransform(translationX: -100, y: 0)
                    
            }, completion: nil)
        }
        else
        {
            UIView.animate(withDuration: 0.000001, delay: 0, options: [.curveLinear]
                , animations: {
                    
                    cell.dataLabel.transform = CGAffineTransform(translationX: 0, y: 0)
                    cell.subLabel.transform = CGAffineTransform(translationX: 0, y: 0)
                    
            }, completion: nil)
            
        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell
        cell?.dataLabel.text = "asdadqkdhklq"
        
        if islist{
            
            return CGSize(width: 350 , height:150)
            
        }else{
            
            return CGSize(width: CGFloat((collectionView.frame.size.width / 2) - 15), height: CGFloat(170))
        }
    }
}
