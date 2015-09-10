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
            if(!urlString.hasBegin("ios://"))
            {
                return true
            }
            if (urlString == "ios://AppGoBack")   //关闭该 ViewController
            {
                self.dismissViewControllerAnimated(true, completion: nil)
            }else if (urlString == "ios://Notification")   //发起通知
            {
                NSNotificationCenter.defaultCenter().postNotificationName("GeneralNotification", object: nil)
            }else if (urlString.hasBegin("ios://modal_bar_"))
            {
                
                var vc = UIHelper.GetVCWithIDFromStoryBoard(.Main, viewControllerIdentity: "DetailWebWithBarVC") as! DetailWebWithBarVC
                vc.Url =  myFirstSubString(urlString,fromIndex: 16).stringByReplacingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
                //self.navigationController?.pushViewController(vc, animated: true)
                self.presentViewController(vc, animated: true, completion: nil)
                
            }else if (urlString.hasBegin("ios://push_bar_"))
            {
                var vc = UIHelper.GetVCWithIDFromStoryBoard(.Main, viewControllerIdentity: "DetailWebWithBarVC") as! DetailWebWithBarVC
                vc.Url =  myFirstSubString(urlString,fromIndex: 15).stringByReplacingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
                self.navigationController?.pushViewController(vc, animated: true)
            }else if (urlString.hasBegin("ios://modal_nobar_"))
            {
                
                var vc = UIHelper.GetVCWithIDFromStoryBoard(.Main, viewControllerIdentity: "DetailWebVC") as! DetailWebVC
                vc.Url =  myFirstSubString(urlString,fromIndex: 17).stringByReplacingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
                //self.navigationController?.pushViewController(vc, animated: true)
                self.presentViewController(vc, animated: true, completion: nil)
                
            }else if (urlString.hasBegin("ios://push_nobar_"))
            {
                var vc = UIHelper.GetVCWithIDFromStoryBoard(.Main, viewControllerIdentity: "DetailWebVC") as! DetailWebVC
                vc.Url =  myFirstSubString(urlString,fromIndex: 17).stringByReplacingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
                self.navigationController?.pushViewController(vc, animated: true)
            }
            return false
            
            
            
        }
        
        func webViewDidStartLoad(webView: UIWebView) {
            
        }
        
        func webViewDidFinishLoad(webView: UIWebView) {
            
            //执行 js放在这里
            
            
      }
}
