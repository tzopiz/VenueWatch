//
//  WebViewerController.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/20/24.
//

import UIKit
import WebKit

protocol IWebViewModel: IBaseViewModel { }
class WebViewModel: IWebViewModel {
    var presentHandler: ((UIViewController, Bool) -> Void)?
    var title: String?
}

class WebViewerController: BaseViewController<WebViewModel> {
    private let webView = WKWebView()
    var url: URL
    
    init(url: URL) {
        self.url = url
        super.init(viewModel: WebViewModel())
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure
    override func setupViews() {
        super.setupViews()
        view.addSubviews(webView)
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
