//
//  FouthVC.swift
//  htmlHdy
//
//  Created by Sky on 15/9/10.
//  Copyright (c) 2015年 HuoDongOrganizer. All rights reserved.
//

import UIKit

class FouthVC: RootVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func ButtonTap(tag: Int) {
         NSURLCache.sharedURLCache().removeAllCachedResponses()
    }

 

}
