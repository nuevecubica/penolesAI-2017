//
//  CoverViewController.swift
//  Penoles DS-2017
//
//  Created by alex vaught on 6/1/18.
//  Copyright © 2018 nuevecubica. All rights reserved.
//

import UIKit

class CoverPage: Page {
    var theBg: String = ""
    var theFront: String = ""
    var theTitle: String = ""

    init(theBg:String, theFront:String, theTitle:String){
        self.theBg = theBg
        self.theFront = theFront
        self.theTitle = theTitle
    }
    
    var viewController: UIViewController {
      let coverViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "coverViewController") as! CoverViewController

      coverViewController.oBg = theBg
      coverViewController.oFront = theFront
      coverViewController.oTitle = theTitle

      return coverViewController
    }
}

class CoverViewController: UIViewController {
    var oBg: String! = nil
    var oFront: String! = nil
    var oTitle: String! = nil
    
    var image: UIImage! = nil

    @IBOutlet weak var backgroundImageCover: UIImageView!
    @IBOutlet weak var textImageCover: UIImageView!
    @IBOutlet weak var frontImageCover: UIImageView!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        textImageCover.alpha = 0
        frontImageCover.alpha = 0
        
        /*
        oBg = "desemp_ambiental_bg"
        oFront =  "desemp_ambiental_title"
        oTitle = "desemp_ambiental_front"
        */
        changeImageBGCover(oBg,oTitle,oFront)
    }
    
    // ASSING A BACKGROUND IMAGE TO THE VIEW
    func changeImageBGCover(_ bk: String,_ txt: String,_ front: String) {
        backgroundImageCover.image = UIImage(named: bk)
        textImageCover.image = UIImage(named: txt)
        frontImageCover.image = UIImage(named: front)
    }
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 2.0, delay:1.0, options: .curveEaseOut, animations: {
            // var textoImage = self.textImageCover.frame
            //textoImage.origin.x += textoImage.size.width / 2
            //self.textImageCover.frame = textoImage
            
            self.textImageCover.alpha = 1
        })
        UIView.animate(withDuration: 3.0, animations: {
            self.frontImageCover.alpha = 1
            
        })
    }
    
    
}


