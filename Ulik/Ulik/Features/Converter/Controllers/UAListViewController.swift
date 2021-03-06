//
//  UAListViewController.swift
//  Ulik
//
//  Created by macbook on 4/4/21.
//

import UIKit
import WebKit

class UAListViewController: UIViewController {
    
    //MARK: - gui variables
    
    private lazy var webView: WKWebView = {
        let view = WKWebView()
        view.navigationDelegate = self
        
        return view
    }()
    
    //MARK: - view life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(webView)
        
        guard let url = URL(string: "https://myfin.by/converter") else { return }
        webView.load(URLRequest(url: url))
        
        self.webView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

//MARK: - extensions

extension UAListViewController: WKNavigationDelegate {
    
}
