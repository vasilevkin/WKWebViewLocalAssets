//
//  WebViewWrapper.swift
//  WKWebViewLocalAssets
//
//  Created by Sergey Vasilevkin on 02/03/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

import UIKit
import WebKit

// Wrapper for the WKWebView to allow usage in Interface Builder

// Detailed explanation, as well as implementation of another workaround
// can be found in my blog:
// https://svasilevkin.wordpress.com/2019/03/02/class-unavailable-wkwebview-before-ios-11-0/

class WebViewWrapper : WKWebView {
    
    required init?(coder: NSCoder) {
        let configuration = WKWebViewConfiguration()
        let controller = WKUserContentController()
        configuration.userContentController = controller;
        super.init(frame: CGRect.zero, configuration: configuration)
    }

}
