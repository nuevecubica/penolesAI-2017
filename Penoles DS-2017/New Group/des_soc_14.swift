//
//  des_soc_14.swift
//  Penoles DS-2017
//
//  Created by alex vaught on 6/19/18.
//  Copyright © 2018 nuevecubica. All rights reserved.
//


import UIKit

class des_soc_14Page: ImagePage {
    override var viewController: UIViewController {
        return des_soc_14ViewController(image: UIImage(named: imageName)!)
    }
}

class des_soc_14ViewController: PageWithButtonsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
        
        let imageScale = view.bounds.width / imageView.image!.size.width
        
        let icon = "play_orange"
        
        //**************************************
        // Button Índice de ecoeficiencia uso de agua
        //**************************************
        let button_vid = UIButton(frame: CGRect())
        button_vid.addTarget(self, action: #selector(btn_vid_Pressed(_:)), for: .touchUpInside)
        button_vid.setImage(UIImage(named : icon), for: UIControlState.normal)
        imageView.addSubview(button_vid)
        button_vid.translatesAutoresizingMaskIntoConstraints = false
        /*
         button_vid.layer.shadowColor = UIColor.black.cgColor
         button_vid.layer.shadowOffset = CGSize(width: 5, height: 5)
         button_vid.layer.shadowRadius = 5
         button_vid.layer.shadowOpacity = 1.0
         */
        // Image coords divided by 3
        NSLayoutConstraint.activate([
            button_vid.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 480.0 * imageScale),
            button_vid.topAnchor.constraint(equalTo: imageView.topAnchor, constant:  620.0 * imageScale)
            ])
        //**************************************
        //**************************************
        
    }
    
    //*****************************************
    // PRESS FUNCTIONS
    //*****************************************
    @IBAction func btn_vid_Pressed(_ sender: UIButton) {
        showVideoPopup(videoName: "des_social_10_vid")
    }
    
}



