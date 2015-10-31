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
	@IBOutlet var spinner: UIActivityIndicatorView!
	
	// 화면이 처음 만들어질 때 딱 한번만 호출됨.
	override func viewDidLoad() {
		//		super.viewDidLoad()
		
//		let url = NSURL(string: "http://www.naver.com")
		let url = NSURL(string: "http://218.53.140.158:9080/main/webapp.gc?c=mobile")
		
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
		self.spinner.stopAnimating()
	}
	
	func webViewDidFinishLoad(webView: UIWebView) {
		NSLog("페이지 로드 완료")
		self.spinner.stopAnimating()
	}
	
	func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
		NSLog((request.URL?.absoluteString)!) // 전체값에 대해 옵셔널을 해지해야 하므로 괄호를 하고 끝에 ! 붙여야 함.
		
		// 이메서드가 가장 먼저 호출 됨.
		// URL을 검사하여 허용할지 말지 사용가능
		// 예를들어 http 나 https 로 시작되는 url을 막으면 사용자는 외부 도메인으로 호출하는게 불가능함.
		
		if let href = request.URL?.absoluteString {
			if let ch = href.rangeOfString("webapp://") {
				let command = href.substringFromIndex(ch.endIndex)
				
				switch command {
				case "camera" :
					let picker = UIImagePickerController()
					picker.sourceType = .PhotoLibrary
					self.presentViewController(picker, animated: false, completion: nil)
					return false
				case "alert" :
					let alert = UIAlertController(title: "알림메시지", message: "안녕하세요", preferredStyle: .Alert)
					let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
					alert.addAction(okAction)
					self.presentViewController(alert, animated: false, completion: nil)
					return false
				default:
					return false
				}
			}
		}
		
		return true // return false로 하면 페이지가 차단됨.
	}
	
	func webViewDidStartLoad(webView: UIWebView) {
		self.spinner.startAnimating()
	}
	
	@IBAction func back(sender: AnyObject) {
		self.wv.goBack()
	}
	
	@IBAction func forward(sender: AnyObject) {
		self.wv.goForward()
	}
	
	@IBAction func reload(sender: AnyObject) {
		self.wv.reload()
	}
	
}

