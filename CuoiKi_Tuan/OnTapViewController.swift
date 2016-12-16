//
//  OnTapViewController.swift
//  CuoiKi_Tuan
//
//  Created by Huỳnh Thanh Tuấn on 12/13/16.
//  Copyright (c) 2016 Huỳnh Thanh Tuấn. All rights reserved.
//

import UIKit

class OnTapViewController: UIViewController {

    var thamSoTruyen: NSUserDefaults!
    
    @IBOutlet weak var ImageOnTap: UIImageView!
    @IBOutlet weak var TextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        thamSoTruyen = NSUserDefaults.standardUserDefaults()
    TextLabel.text=thamSoTruyen.objectForKey("OnTap") as NSString
        
    if(TextLabel.text == "TheThao")
    {
        ImageOnTap.image = UIImage(named: "theothao.jpg")
    }
    else
    {
        if(TextLabel.text == "CoTheNguoi")
        {
            ImageOnTap.image = UIImage(named: "cothenguoi.jpg")
        }
        else
        {
            ImageOnTap.image = UIImage(named: "thucpham.jpg")
        }
    }

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    


}
