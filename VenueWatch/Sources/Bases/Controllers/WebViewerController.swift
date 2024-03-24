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
    var url: URL
    init(url: URL) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension WebViewerController {
    override func setupViews() {
        super.setupViews()
        addSubviews(webView)
    }
    override func layoutViews() {
        super.layoutViews()
        webView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    override func configureViews() {
        super.configureViews()
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
