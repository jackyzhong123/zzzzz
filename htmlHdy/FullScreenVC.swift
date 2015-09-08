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

    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        var urlString = request.URL?.absoluteString as String!
        if (urlString == "ios://appGoBack")
        {
            self.navigationController?.popViewControllerAnimated(true)
        }
        
        
        if(urlString.hasBegin("ios://"))
        {
            
            var url = urlString.substringFromIndex(advance(urlString.startIndex, 6))
            var vc = UIHelper.GetVCWithIDFromStoryBoard(.Main, viewControllerIdentity: "DetailWebVC") as! DetailWebVC
            //   UserDefaultsHelper.setStringForKey(url, key: "targetUrl")
            vc.Url =  url.stringByReplacingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        return true
    }
    

    
    
    
}
