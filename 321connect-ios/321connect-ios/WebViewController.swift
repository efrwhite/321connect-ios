//
//  WebViewController.swift
//  321connect-ios
//
//  Created by Edward Ladia on 7/11/22.
//

import UIKit
import WebKit
import CoreData

class WebViewController: UIViewController {

    var links: String = ""
   
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
  
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = URL (string: links)
        let request = URLRequest(url: url!)
        
        
        webView.load(request)
        
        
    }
  
    
}
