//
//  ThirdVC.swift
//  htmlHdy
//
//  Created by Sky on 15/9/10.
//  Copyright (c) 2015年 HuoDongOrganizer. All rights reserved.
//

import UIKit

class ThirdVC: RootVC ,UIWebViewDelegate{

    //
    //  FirstViewController.swift
    //  htmlHdy
    //
    //  Created by Sky on 15/9/8.
    //  Copyright (c) 2015年 HuoDongOrganizer. All rights reserved.
    //

        
        @IBOutlet var webView: UIWebView!
        
        
        
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            
            
            
            
            
            
        }
        
        override func RenderDetail() {
            var urlString:String = AppConfig.SERVICE_ROOT_PATH + "third.html"
            var urlRequest = NSURLRequest(URL:NSURL(string:urlString)!)
            webView.loadRequest(urlRequest)
            webView.delegate = self
            
            
            
            
        }
        
        override func changeUserStatus (notification:NSNotification)
        {
            webView.stringByEvaluatingJavaScriptFromString("notification()")
        }
        
        
     
        
        
        func webViewDidStartLoad(webView: UIWebView) {
            
        }
        
        func webViewDidFinishLoad(webView: UIWebView) {
            UIApplication.sharedApplication().setStatusBarHidden(true, withAnimation: UIStatusBarAnimation.None)
            
            //执行 js放在这里
        }
}


