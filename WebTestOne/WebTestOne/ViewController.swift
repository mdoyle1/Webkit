//
//  ViewController.swift
//  WebTestOne
//
//  Created by Doyle, Mark(Information Technology Services) on 5/1/19.
//  Copyright © 2019 Doyle, Mark(Information Technology Services). All rights reserved.
//

import Cocoa
import WebKit

let url = URL(string: "URL TO LOAD")

class ViewController: NSViewController, WKNavigationDelegate {


   // @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        guard let scriptPath = Bundle.main.path(forResource: "script", ofType: "js"),
//            let scriptSource = try? String(contentsOfFile: scriptPath) else { return }
        
        let contentController = WKUserContentController()
        //let scriptSource = "rtbUserName.value = `doylema@easternct.edu`"
       
//        let script = WKUserScript(source: scriptSource, injectionTime: .atDocumentEnd, forMainFrameOnly: false)
//        contentController.addUserScript(script)
        let config = WKWebViewConfiguration()
         config.userContentController = contentController
        let webView = WKWebView(frame: .zero, configuration: config)
        view.addSubview(webView)
        let layoutGuide = view
        
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor).isActive = true
        webView.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor).isActive = true
        webView.topAnchor.constraint(equalTo: layoutGuide.topAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor).isActive = true

       // webView.configuration
        webView.navigationDelegate = self
        webView.wantsLayer = true
        webView.load(URLRequest(url: url!))
        webView.evaluateJavaScript("window.onload = function () {rtbUserName.value = 'doylema@easternct.edu';rtbPassword.value = 'Spring2016!';btnLogin.click()}", completionHandler: nil)
        //webView.evaluateJavaScript("window.onload = function () {window.location.href = 'https://ecsu.e-isg.com/eQuip/UI/Controller.aspx?page=searchasset'};", completionHandler: nil)
       // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

