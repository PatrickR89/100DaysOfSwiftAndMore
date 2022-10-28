//
//  WikiDetailViewController.swift
//  project16
//
//  Created by Patrick on 05.08.2022..
//

import UIKit
import WebKit

class WikiDetailViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView?
    var website: String

    required init (website: String) {
        self.website = website

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "BACK", style: .plain, target: self, action: #selector(dismissView))

        guard let url = URL(string: website) else {
            print("not available")
            return
        }

        setupWebView()

        webView?.load(URLRequest(url: url))
        webView?.allowsBackForwardNavigationGestures = false
    }

    func setupWebView() {
        webView = WKWebView()
        webView?.navigationDelegate = self

        view = webView
    }

    @objc func dismissView() {
        self.dismiss(animated: true)
    }
}
