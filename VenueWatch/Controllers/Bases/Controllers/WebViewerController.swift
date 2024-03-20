//
//  WebViewerController.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/20/24.
//

import UIKit
import WebKit

class WebViewerController: BaseViewController {
    
    private let webView = WKWebView()
    private let urlString: String
    
    init(with urlString: String) {
        self.urlString = urlString
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure
extension WebViewerController {
    override func setupViews() {
        super.setupViews()
        addSubviews(webView)
    }
    override func layoutViews() {
        super.layoutViews()
    }
    override func configureViews() {
        super.configureViews()
        addNavBarButton(at: .right, with: "Close", selector: #selector(handler))
    }
}

// MARK: - Actions
extension WebViewerController {
    @IBAction private func handler() {
        self.dismiss(animated: true, completion: nil)
    }
}

