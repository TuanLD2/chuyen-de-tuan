//
//  EndGameViewController.swift
//  CuoiKi_Tuan
//
//  Created by Huỳnh Thanh Tuấn on 12/14/16.
//  Copyright (c) 2016 Huỳnh Thanh Tuấn. All rights reserved.
//

import UIKit

class EndGameViewController: UIViewController {

    @IBOutlet weak var LabelWrong: UILabel!
    @IBOutlet weak var LoiNhac: UILabel!
    @IBOutlet weak var LabelShow: UILabel!
    var thamSoTruyen : NSUserDefaults!
    var loiNhac : NSString!
    var score = 0
    var wrong = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        thamSoTruyen=NSUserDefaults.standardUserDefaults()
        if(thamSoTruyen.integerForKey("Score")>5)
        {
            LoiNhac.text = "Conratulation! It's Good"
        }
        else
        {
            LoiNhac.text = "Condolatory! It's Bad, Try Again"
        }
        wrong = thamSoTruyen.valueForKey("Wrong") as NSInteger
        LabelWrong.text = NSString(format: "Wrong :%i",wrong)
        score = thamSoTruyen.valueForKey("Score") as NSInteger
        LabelShow.text = NSString(format: "Score :%i",score)

    }
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
