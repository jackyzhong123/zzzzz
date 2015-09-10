//
//  SecondViewController.swift
//  htmlHdy
//
//  Created by Sky on 15/9/8.
//  Copyright (c) 2015年 HuoDongOrganizer. All rights reserved.
//

import UIKit

class SecondViewController: RootVC,UIWebViewDelegate {

 
        
        @IBOutlet var webView: UIWebView!
        override func viewDidLoad() {
            super.viewDidLoad()
            
        }
        
        override func RenderDetail() {
            var urlString:String = "http://jacky.chinacloudsites.cn/second.html"
            var urlRequest = NSURLRequest(URL:NSURL(string:urlString)!)
            webView.loadRequest(urlRequest)
            webView.delegate = self
        }

        
        
        
        
        func webViewDidStartLoad(webView: UIWebView) {
            
        }
        
        func webViewDidFinishLoad(webView: UIWebView) {
            
            //执行 js放在这里
            
            
      }
}
