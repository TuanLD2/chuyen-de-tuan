//
//  PlayModeViewController.swift
//  CuoiKi_Tuan
//
//  Created by Huỳnh Thanh Tuấn on 12/16/16.
//  Copyright (c) 2016 Huỳnh Thanh Tuấn. All rights reserved.
//

import UIKit

class PlayModeViewController: UIViewController {
    var thamSoTruyen: NSUserDefaults!

    @IBAction func btnFood(sender: AnyObject) {
        thamSoTruyen.setObject("Food", forKey: "Mode")
    }
    @IBAction func btnBody(sender: AnyObject) {
        thamSoTruyen.setObject("Body", forKey: "Mode")
    }
    @IBAction func btnSport(sender: AnyObject) {
        thamSoTruyen.setObject("Sport", forKey: "Mode")
    }
    @IBAction func btnPlay(sender: AnyObject) {
        thamSoTruyen.setObject("Play", forKey: "Mode")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        thamSoTruyen = NSUserDefaults.standardUserDefaults()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        thamSoTruyen.synchronize()
    }
}
