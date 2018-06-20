//
//  des_eco_10.swift
//  Penoles DS-2017
//
//  Created by alex vaught on 6/19/18.
//  Copyright © 2018 nuevecubica. All rights reserved.
//


import UIKit

class des_eco_10Page: ImagePage {
    override var viewController: UIViewController {
        return des_eco_10ViewController(image: UIImage(named: imageName)!)
    }
}

class des_eco_10ViewController: PageWithButtonsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
        
        let imageScale = view.bounds.width / imageView.image!.size.width
        
        let icon = "plus"
        
    
        //*************************************
        //**************************************
        // Button Volumen de ventas Quimicos
        //**************************************
        let button_vvq = UIButton(frame: CGRect())
        button_vvq.addTarget(self, action: #selector(button_vvq_Pressed(_:)), for: .touchUpInside)
        button_vvq.setImage(UIImage(named : icon), for: UIControlState.normal)
        imageView.addSubview(button_vvq)
        button_vvq.translatesAutoresizingMaskIntoConstraints = false
        
        // Image coords divided by 3
        NSLayoutConstraint.activate([
            button_vvq.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 854.9 * imageScale),
            button_vvq.topAnchor.constraint(equalTo: imageView.topAnchor, constant:  1110.0 * imageScale)
            ])
        //*************************************
        //*************************************
        //**************************************
        // Button Volumen de ventas Metales
        //**************************************
        let button_vvm = UIButton(frame: CGRect())
        button_vvm.addTarget(self, action: #selector(button_vvm_Pressed(_:)), for: .touchUpInside)
        button_vvm.setImage(UIImage(named : icon), for: UIControlState.normal)
        imageView.addSubview(button_vvm)
        button_vvm.translatesAutoresizingMaskIntoConstraints = false
        
        // Image coords divided by 3
        NSLayoutConstraint.activate([
            button_vvm.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 560.0 * imageScale),
            button_vvm.topAnchor.constraint(equalTo: imageView.topAnchor, constant:  1220.0 * imageScale)
            ])
        //*************************************
    }
    
    //*****************************************
    // PRESS FUNCTIONS
    //*****************************************

    @IBAction func button_vvq_Pressed(_ sender: UIButton) {
        showImagePopup(image:#imageLiteral(resourceName: "volumen_ventas_quimicos"))
        //showVideoPopup(videoName: "video")
    }
    @IBAction func button_vvm_Pressed(_ sender: UIButton) {
        showImagePopup(image:#imageLiteral(resourceName: "volumen_ventas_metales"))
        //showVideoPopup(videoName: "video")
    }
}
