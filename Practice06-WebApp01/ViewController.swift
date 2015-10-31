//
//  ViewController.swift
//  Practice06-WebApp01
//
//  Created by Mac on 2015. 10. 31..
//  Copyright © 2015년 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


	@IBOutlet var wv: UIWebView!
	
	// 화면이 처음 만들어질 때 딱 한번만 호출됨.
	override func viewDidLoad() {
		//		super.viewDidLoad()
		
		let url = NSURL(string: "http://www.naver.com")
		let req = NSURLRequest(URL: url!)
		
		wv.loadRequest(req)
		
		// ATS (App Transport Security)
		// ios9 부터 https 만 허용하도록 규정이 바뀜
		// info.plist 우클릭 -> Open As -> Source Code
//		<key>NSAppTransportSecurity</key>
//		<dict>
//		<key>NSAllowsArbitraryLoads</key>
//		<true/>
//		</dict>

	}
	
}

