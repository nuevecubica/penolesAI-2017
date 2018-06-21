//
//  res_operacion_8.swift
//  Penoles AI-2017
//
//  Created by alex vaught on 6/20/18.
//  Copyright © 2018 nuevecubica. All rights reserved.
//

import UIKit

class res_operacion_8Page: ImagePage {
    override var viewController: UIViewController {
        return res_operacion_8ViewController(image: UIImage(named: imageName)!)
    }
}

class res_operacion_8ViewController: PageWithButtonsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
        
        let imageScale = view.bounds.width / imageView.image!.size.width
        
        let icon = "plus"
        
        
        //*************************************
        //**************************************
        // Button Cifras financieras sobresalientes
        //**************************************
        let button_cfs = UIButton(frame: CGRect())
        button_cfs.addTarget(self, action: #selector(button_cfs_Pressed(_:)), for: .touchUpInside)
        button_cfs.setImage(UIImage(named : icon), for: UIControlState.normal)
        imageView.addSubview(button_cfs)
        button_cfs.translatesAutoresizingMaskIntoConstraints = false
        
        // Image coords divided by 3
        NSLayoutConstraint.activate([
            button_cfs.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 854.9 * imageScale),
            button_cfs.topAnchor.constraint(equalTo: imageView.topAnchor, constant:  454.0 * imageScale)
            ])
        //*************************************
        
        
    }
    
    //*****************************************
    // PRESS FUNCTIONS
    //*****************************************
    
    @IBAction func button_cfs_Pressed(_ sender: UIButton) {
        showImagePopup(image:#imageLiteral(resourceName: "mn_CifrasFinancierasSobresalientes"))
        //showVideoPopup(videoName: "video")
    }
    
}
