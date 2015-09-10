//
//  FullScreenVC.swift
//  htmlHdy
//
//  Created by Sky on 15/9/9.
//  Copyright (c) 2015年 HuoDongOrganizer. All rights reserved.
//

import UIKit

class FullScreenVC: RootVC ,UIWebViewDelegate{
    var Url:String!
    
    @IBOutlet var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.hidden = true
        webView.delegate = self
        var urlString:String = Url
        var urlRequest = NSURLRequest(URL:NSURL(string:urlString)!)
        webView.loadRequest(urlRequest)

// [[UIApplication sharedApplication]setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
        
        UIApplication.sharedApplication().setStatusBarHidden(true, withAnimation: UIStatusBarAnimation.None)
    }

    
    
    
    
    
}
