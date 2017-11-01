//
//  CFHomeViewController.swift
//  Padala
//
//  Created by Vamshi krishna Padala on 4/9/17.
//  Copyright © 2017 Vamshi krishna Padala. All rights reserved.
//

import UIKit

class CFHomeViewController: UIViewController {
	
    override func viewDidLoad() {
        super.viewDidLoad()
        
		edgesForExtendedLayout = []
		
		let webView = UIWebView(frame: self.view.frame)
		webView.scalesPageToFit = true
		
		view.addSubview(webView)
		addConstraints(for: webView)
		
        navigationController?.navigationBar.titleTextAttributes = [ NSAttributedStringKey.font: UIFont(name: "AvenirNext-Medium", size: 24)!]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor .white]
        navigationController?.navigationBar.topItem?.title = "Home"
        
        navigationController?.navigationBar.barTintColor = UIColor.orange
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "ham"), style: .plain, target: self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)))
        
        navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Logout1"), style: .plain, target: self, action: #selector(logout))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        
        if let url = URL(string: "http://www.codeforce.com/") {
			
            let request = URLRequest(url: url)
            webView.loadRequest(request)
        }
    }
    
    @objc func logout() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController: UIViewController? = storyboard.instantiateViewController(withIdentifier: "ViewController")
        self.present(viewController!, animated: true, completion: nil)
    }
	
	private func addConstraints(for webView: UIWebView) {
		
		webView.translatesAutoresizingMaskIntoConstraints = false
		
		let leadingConstraint = NSLayoutConstraint(item: webView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0)
		
		let trailingConstraint = NSLayoutConstraint(item: webView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0)
		
		let topConstraint = NSLayoutConstraint(item: webView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0)
		
		let bottomConstraint = NSLayoutConstraint(item: webView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
		
		view.addConstraints([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])
	}
}
