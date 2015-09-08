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

        
        
        func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
            var urlString = request.URL?.absoluteString as String!
            if(urlString.hasBegin("ios://"))
            {
                
                var url = urlString.substringFromIndex(advance(urlString.startIndex, 6))
                var vc = UIHelper.GetVCWithIDFromStoryBoard(.Main, viewControllerIdentity: "DetailWebVC") as! DetailWebVC
                //   UserDefaultsHelper.setStringForKey(url, key: "targetUrl")
                vc.Url =  url.stringByReplacingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
                
                self.navigationController?.pushViewController(vc, animated: true)
                
//                self.presentViewController(vc, animated: true, completion: { () -> Void in
//                    
//                })
            }
            
            return true
        }
        
        func webViewDidStartLoad(webView: UIWebView) {
            
        }
        
        func webViewDidFinishLoad(webView: UIWebView) {
            
            //执行 js放在这里
            
            
    webView.stringByEvaluatingJavaScriptFromString("alter('hello')")
        }
}
