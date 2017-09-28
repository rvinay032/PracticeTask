//
//  CollectionViewCell.swift
//  PracticeTask
//
//  Created by appinventiv on 27/09/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        NotificationCenter.default.post(name: NSNotification.Name("toggleSideMenuHide"), object: nil, userInfo: nil)
    }
    
}
