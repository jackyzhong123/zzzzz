//
//  DetailWebVC.swift
//  htmlHdy
//
//  Created by Sky on 15/9/8.
//  Copyright (c) 2015年 HuoDongOrganizer. All rights reserved.
//

import UIKit

class DetailWebVC: RootVC ,UIWebViewDelegate{

    
    @IBOutlet var webView: UIWebView!
    var Url:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    override func RenderDetail() {
      //  var urlString:String = "http://prehdy.chinacloudsites.cn/User/Events/101224"
           }
    
    override func viewDidAppear(animated: Bool) {
        var urlRequest = NSURLRequest(URL:NSURL(string:Url)!)
        
        webView.loadRequest(urlRequest)
       // UIHelper.SetNaviBarLeftItemWithBackImg(self, action:"toggleRightMenu:")
        webView.delegate =  self

    }
    
    func toggleRightMenu(sender: AnyObject)
    {
        if (webView.canGoBack)
        {
            webView.goBack()
        }else
        {
            self.navigationController?.popViewControllerAnimated(true)
        }

    }
    
    
    
     func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        var urlString = request.URL?.absoluteString as String!

        if(urlString.hasBegin("ios://"))
        {
            var url = urlString.substringFromIndex(advance(urlString.startIndex, 6))
            var vc = UIHelper.GetVCWithIDFromStoryBoard(.Main, viewControllerIdentity: "FullScreenVC") as! FullScreenVC
            //   UserDefaultsHelper.setStringForKey(url, key: "targetUrl")
            vc.Url =  url.stringByReplacingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
 self.navigationController?.pushViewController(vc, animated: true)
            return false
        }
        
        if(urlString.hasBegin("file"))
        {
            return false
        }
        
      

        return true
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
