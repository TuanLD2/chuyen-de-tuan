//
//  ViewController.swift
//  CuoiKi_Tuan
//
//  Created by Huỳnh Thanh Tuấn on 12/13/16.
//  Copyright (c) 2016 Huỳnh Thanh Tuấn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var thamSoTruyen: NSUserDefaults!

    @IBOutlet weak var HighScore: UILabel!
    @IBOutlet weak var NameHighScore: UILabel!
    @IBOutlet weak var txtName: UITextField!
    
    @IBAction func btnTheThao(sender: AnyObject) {
       thamSoTruyen.setObject("TheThao", forKey: "OnTap")
    }
    
    @IBAction func btnCoTheNguoi(sender: AnyObject) {
       thamSoTruyen.setObject("CoTheNguoi", forKey: "OnTap")
    }
    @IBAction func btnThucPham(sender: AnyObject) {
       thamSoTruyen.setObject("ThucPham", forKey: "OnTap")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        thamSoTruyen = NSUserDefaults.standardUserDefaults()
        if(thamSoTruyen.objectForKey("NameHighScore") != nil)
        {
            NameHighScore.text = thamSoTruyen.objectForKey("NameHighScore") as NSString
        }
        
        if(thamSoTruyen.objectForKey("HighScore") != nil)
        {
            var x = thamSoTruyen.objectForKey("HighScore") as NSInteger
            HighScore.text = NSString(format: "(^_^) %i",x)
            
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(txtName.text != "")
        {
            thamSoTruyen.setObject(txtName.text, forKey: "Name")
        }
        thamSoTruyen.synchronize()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }


}

