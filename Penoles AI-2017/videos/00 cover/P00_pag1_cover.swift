//
//  P00_pag1_cover.swift
//  Penoles DS-2017
//
//  Created by alex vaught on 5/14/18.
//  Copyright © 2018 nuevecubica. All rights reserved.
//

import UIKit

class P00_pag1_cover: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		// ASSING A BACKGROUND IMAGE TO THE VIEW
		func assignbackground(){
			let background = UIImage(named: "mainCover")
			var imageView : UIImageView!
			imageView = UIImageView(frame: view.bounds)
			imageView.contentMode =  UIViewContentMode.scaleAspectFill
			imageView.clipsToBounds = true
			imageView.image = background
			imageView.center = view.center
			view.addSubview(imageView)
			self.view.sendSubview(toBack: imageView)
		}
		
		// SWIPE RIGHT

		let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
		rightSwipe.direction = UISwipeGestureRecognizerDirection.right
		self.view.addGestureRecognizer(rightSwipe)
	
		
		
		// Do any additional setup after loading the view.
		
	
		print("I AM IN......")
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	// REMOVE STATUS BAR
	override var prefersStatusBarHidden: Bool{
		return true
	}
	
	/*
	// MARK: - Navigation
	
	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
	// Get the new view controller using segue.destinationViewController.
	// Pass the selected object to the new view controller.
	}
	*/
	
}

// SWIPE ACTION FUNCTION




extension UIViewController
{
	@objc func swipeAction(swipe:UISwipeGestureRecognizer){
		switch swipe.direction.rawValue {
		case 1:
			performSegue(withIdentifier: "goLeft", sender: self)
			print("fuck left")
		case 2:
			performSegue(withIdentifier: "goRight", sender: self)
			print("fuck right")
		default:
			break
		}
	}
}

