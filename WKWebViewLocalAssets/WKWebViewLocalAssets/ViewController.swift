//
//  ViewController.swift
//  WKWebViewLocalAssets
//
//  Created by Sergey Vasilevkin on 02/03/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var webView: WebViewWrapper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        
        loadWebViewContent()
    }
    
    /// Load local html resource as File or as String
    func loadWebViewContent(_ file: String = "index", asFile: Bool = true) {
        
        guard let filePath = Bundle.main.path(forResource: file, ofType: "html",
                                              inDirectory:  "LocalWebAssets") else {
            print("Unable to load local html file: \(file)")
            return
        }
        
        if asFile {
            // load local file
            let filePathURL = URL.init(fileURLWithPath: filePath)
            let fileDirectoryURL = filePathURL.deletingLastPathComponent()
            webView.loadFileURL(filePathURL, allowingReadAccessTo: fileDirectoryURL)
        } else {
            do {
                // load html string. baseURL is required for local files to load correctly
                let html = try String(contentsOfFile: filePath, encoding: .utf8)
                webView.loadHTMLString(html, baseURL: Bundle.main.resourceURL?.appendingPathComponent("LocalWebAssets"))
            } catch {
                print("Unable to load local html resource as string")
            }
        }
    }

}

extension ViewController : WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Delegate method didFinish navigation:");
    }
}
