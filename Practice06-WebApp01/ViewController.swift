//
//  ViewController.swift
//  Practice06-WebApp01
//
//  Created by Mac on 2015. 10. 31..
//  Copyright © 2015년 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {


	@IBOutlet var wv: UIWebView!
	
	// 화면이 처음 만들어질 때 딱 한번만 호출됨.
	override func viewDidLoad() {
		//		super.viewDidLoad()
		
		let url = NSURL(string: "http://www.naver.com")
		let req = NSURLRequest(URL: url!)
		
		wv.delegate = self
		
		wv.loadRequest(req)
		
		// ATS (App Transport Security)
		// ios9 부터 https 만 허용하도록 규정이 바뀜
		// info.plist 우클릭 -> Open As -> Source Code
/*
		<key>NSAppTransportSecurity</key>
		<dict>
		<key>NSAllowsArbitraryLoads</key>
		<true/>
		</dict>
*/
	}
	
	func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
		NSLog("페이지 로드 에러")
	}
	
	func webViewDidFinishLoad(webView: UIWebView) {
		NSLog("페이지 로드 완료")
	}
	
	func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
		NSLog((request.URL?.absoluteString)!) // 전체값에 대해 옵셔널을 해지해야 하므로 괄호를 하고 끝에 ! 붙여야 함.
		
		// 이메서드가 가장 먼저 호출 됨.
		// URL을 검사하여 허용할지 말지 사용가능
		// 예를들어 http 나 https 로 시작되는 url을 막으면 사용자는 외부 도메인으로 호출하는게 불가능함.
		
		return true // return false로 하면 페이지가 차단됨.
	}
}

