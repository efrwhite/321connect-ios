//
//  WebViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 7/11/22.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    var links: String = ""
    
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL (string: links)
        let request = URLRequest(url: url!)
        webView.load(request)
    }


}
