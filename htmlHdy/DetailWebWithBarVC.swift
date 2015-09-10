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
        
        UIHelper.SetNaviBarLeftItemWithBackImg(self, action: "goback")
        
    }
    
    func goback()
    {
        if (webView.canGoBack)
        {
            webView.goBack()
        }else
        {
            if (self.navigationController == nil)
            {
                self.dismissViewControllerAnimated(true, completion: nil)
            }else
            {
                 self.navigationController?.popViewControllerAnimated(true)
            }
            
           
        }
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
    
  
    
    override func ButtonTap(tag: Int) {
        if (webView.canGoBack)
        {
            webView.goBack()
        }else
        {
            if (self.navigationController == nil)
            {
                self.dismissViewControllerAnimated(true, completion: nil)
            }else
            {
                self.navigationController?.popViewControllerAnimated(true)
            }
            
            
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
