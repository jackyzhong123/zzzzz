//
//  DetailWebWithBarVC.swift
//  htmlHdy
//
//  Created by haha on 15/9/10.
//  Copyright (c) 2015年 HuoDongOrganizer. All rights reserved.
//

import UIKit

class DetailWebWithBarVC:RootVC ,UIWebViewDelegate{
    
    
    
    
    @IBOutlet var webView: UIWebView!
    var Url:String!
    
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func RenderDetail() {
    }
    
    override func viewDidAppear(animated: Bool) {
        var urlRequest = NSURLRequest(URL:NSURL(string:Url)!)
        webView.loadRequest(urlRequest)
        webView.delegate =  self
        
        self.navigationController?.navigationBar.hidden = false   //显示navigationbar
    }
    
    override func changeUserStatus (notification:NSNotification)
    {
        webView.stringByEvaluatingJavaScriptFromString("notification()")
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
        }else if (urlString.hasBegin("ios://modal|bar|"))
        {
            
            var vc = UIHelper.GetVCWithIDFromStoryBoard(.Main, viewControllerIdentity: "DetailWebWithBarVC") as! DetailWebVC
            vc.Url =  myFirstSubString(urlString,fromIndex: 16).stringByReplacingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
            //self.navigationController?.pushViewController(vc, animated: true)
            self.presentViewController(vc, animated: true, completion: nil)
            
        }else if (urlString.hasBegin("ios://push|bar|"))
        {
            var vc = UIHelper.GetVCWithIDFromStoryBoard(.Main, viewControllerIdentity: "DetailWebWithBarVC") as! DetailWebVC
            vc.Url =  myFirstSubString(urlString,fromIndex: 15).stringByReplacingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
            self.navigationController?.pushViewController(vc, animated: true)
        }else if (urlString.hasBegin("ios://modal|nobar|"))
        {
            
            var vc = UIHelper.GetVCWithIDFromStoryBoard(.Main, viewControllerIdentity: "DetailWebVC") as! DetailWebVC
            vc.Url =  myFirstSubString(urlString,fromIndex: 17).stringByReplacingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
            //self.navigationController?.pushViewController(vc, animated: true)
            self.presentViewController(vc, animated: true, completion: nil)
            
        }else if (urlString.hasBegin("ios://push|nobar|"))
        {
            var vc = UIHelper.GetVCWithIDFromStoryBoard(.Main, viewControllerIdentity: "DetailWebVC") as! DetailWebVC
            vc.Url =  myFirstSubString(urlString,fromIndex: 17).stringByReplacingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
            self.navigationController?.pushViewController(vc, animated: true)
        }
        return false
        
        
    }
    
    override func ButtonTap(tag: Int) {
        if (webView.canGoBack)
        {
            webView.goBack()
        }else
        {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        
        //执行 js放在这里
        //  webView.stringByEvaluatingJavaScriptFromString("$('.navbar').hide()")
        
        // webView.stringByEvaluatingJavaScriptFromString("alter('hello')")
    }
    
    
}
