//
//  PageWithButtonsViewController.swift
//  Penoles DS-2017
//
//  Created by Pablo Gomez Basanta on 6/13/18.
//  Copyright © 2018 nuevecubica. All rights reserved.
//

import UIKit
import AVKit

class PageWithButtonsViewController: PageViewController {
  func showImagePopup(image: UIImage) {
    let popupVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "imagePopup") as! ImagePopupViewController
    popupVC.image = image

    present(popupVC, animated: true, completion: nil)
  }

  func showVideoPopup(videoName: String) {
    let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: videoName, ofType:"mp4")!))
    let playerController = AVPlayerViewController()
    playerController.player = player
    present(playerController, animated: true) {
      player.play()
    }
  }
}
