//
//  PageNavigationViewController.swift
//  Penoles DS-2017
//
//  Created by Pablo Gomez Basanta on 5/22/18.
//  Copyright © 2018 nuevecubica. All rights reserved.
//

import UIKit

protocol Page {
    var viewController: UIViewController { get }
}

protocol ScrollablePageViewController {
  var showsScrollIndicator: Bool { get }
}

class Section {
    var name: String
    var pages: [Page] = []
    
    init(name: String, pages: [Page]) {
        self.name = name
        self.pages = pages
    }
}

class PageNavigationViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var menuContainer: UIView!
    @IBOutlet weak var menuStackView: UIStackView!

    @IBOutlet weak var scrollInidcator: UIImageView!
    
    var menuConstraint: NSLayoutConstraint!

    var sections:[Section] = [
        Section(name: "Portada", pages: [
           // ImagePage(imageName: "portada"),
            CoverPage(theBg: "cover_bg", theFront: "cover_title", theTitle: "cover_front")
            ]),
        
        Section(name: "Perfil de Peñoles", pages: [
            
            ImagePage(imageName: "perfil_pag1"),
            MapPage(),
            ImagePage(imageName: "perfil_pag3"),
            ImagePage(imageName: "perfil_pag4"),
            ]),
        
        Section(name: "Mensaje del Director General", pages: [
            ImagePage(imageName: "mensaje_director"),
            ]),
        
        Section(name: "Gestión de la sustentabilidad", pages: [
            CoverPage(theBg: "gestion_bg", theFront: "gestion_front",theTitle:"gestion_title"),
            ImagePage(imageName: "gestion_pag2"),
            ImagePage(imageName: "gestion_pag3"),
            ImagePage(imageName: "gestion_pag4"),
            ImagePage(imageName: "gestion_pag5"),
            ImagePage(imageName: "gestion_pag6"),
            gestion_7Page(imageName:"gestion_pag7"),
            ]),
        
        Section(name: "Grupos de interés", pages: [
            CoverPage(theBg: "grupos_bg", theFront: "grupos_front",theTitle:"grupos_title"),
            ImagePage(imageName: "grupos_pag2"),
            ]),
        
        Section(name: "Transparencia y cumplimiento", pages: [
            CoverPage(theBg: "transparencia_bg", theFront: "transparencia_front",theTitle:"transparencia_title"),
            ImagePage(imageName: "transparencia_pag2"),
            ImagePage(imageName: "transparencia_pag3"),
            ImagePage(imageName: "transparencia_pag4"),
            ImagePage(imageName: "transparencia_pag5"),
            ImagePage(imageName: "transparencia_pag6"),
            ImagePage(imageName: "transparencia_pag7"),
            ImagePage(imageName: "transparencia_pag8"),
            ImagePage(imageName: "transparencia_pag9"),
            ImagePage(imageName: "transparencia_pag10"),
            ]),
        
        Section(name: "Desempeño económico", pages: [
            CoverPage(theBg: "desemp_economico_bg", theFront: "desemp_economico_front",theTitle:"desemp_economico_title"),
            ImagePage(imageName: "des_economico_pag2"),
            des_eco_3Page(imageName: "des_economico_pag3"),
            des_eco_4Page(imageName: "des_economico_pag4"),
            ImagePage(imageName: "des_economico_pag5"),
            ImagePage(imageName: "des_economico_pag6"),
            ImagePage(imageName: "des_economico_pag7"),
            ImagePage(imageName: "des_economico_pag8"),
            ImagePage(imageName: "des_economico_pag9"),
            des_eco_10Page(imageName: "des_economico_pag10"),
            ImagePage(imageName: "des_economico_pag11"),
            ImagePage(imageName: "des_economico_pag12"),
            ]),
        
        Section(name: "Desempeño ambiental", pages: [
            CoverPage(theBg: "desemp_ambiental_bg", theFront: "desemp_ambiental_front",theTitle:"desemp_ambiental_title"),
            des_amb_2Page(imageName: "des_ambiental_pag2"),
            ImagePage(imageName: "des_ambiental_pag3"),
            des_amb_4Page(imageName: "des_ambiental_pag4"),
            des_amb_5Page(imageName: "des_ambiental_pag5"),
            des_amb_6Page(imageName: "des_ambiental_pag6"),
            ImagePage(imageName: "des_ambiental_pag7"),
            des_amb_8Page(imageName: "des_ambiental_pag8"),
            des_amb_9Page(imageName: "des_ambiental_pag9"),
            ImagePage(imageName: "des_ambiental_pag10"),
            ]),
        
        Section(name: "Desempeño social", pages: [
            CoverPage(theBg: "desemp_social_bg", theFront: "desemp_social_front",theTitle:"desemp_social_title"),
            des_soc_2Page(imageName:"des_social_pag2"),
            ImagePage(imageName: "des_social_pag3"),
            ImagePage(imageName: "des_social_pag4"),
            ImagePage(imageName: "des_social_pag5"),
            ImagePage(imageName: "des_social_pag6"),
            ImagePage(imageName: "des_social_pag7"),
            des_soc_8Page(imageName:"des_social_pag8"),
            ImagePage(imageName: "des_social_pag9"),
            des_soc_10Page(imageName:"des_social_pag10"),
            ImagePage(imageName: "des_social_pag11"),
            ImagePage(imageName: "des_social_pag12"),
            ImagePage(imageName: "des_social_pag13"),
            des_soc_14Page(imageName:"des_social_pag14"),
            ImagePage(imageName: "des_social_pag15"),
            ImagePage(imageName: "des_social_pag16"),
            ImagePage(imageName: "des_social_pag17"),
            ImagePage(imageName: "des_social_pag18"),
            ImagePage(imageName: "des_social_pag19"),
            ImagePage(imageName: "des_social_pag20"),
            ImagePage(imageName: "des_social_pag21"),
            ImagePage(imageName: "des_social_pag22"),
            ImagePage(imageName: "des_social_pag23"),
            ImagePage(imageName: "des_social_pag24"),
            ImagePage(imageName: "des_social_pag25"),
            ImagePage(imageName: "des_social_pag26"),
            ImagePage(imageName: "des_social_pag27"),
            ImagePage(imageName: "des_social_pag28"),
            ImagePage(imageName: "des_social_pag29"),
            ImagePage(imageName: "des_social_pag30"),
            ]),
        
        Section(name: "Premios y distinciones", pages: [
            ImagePage(imageName: "premios_pag1"),
            ]),
        
        Section(name: "Asociaciones", pages: [
            ImagePage(imageName: "asociaciones_pag1"),
            ]),
        
        Section(name: "Cuarto Estado Financiero", pages: [
            ImagePage(imageName: "estado_financiero_pag1"),
            ]),
        
        Section(name: "Acerca de este informe", pages: [
            ImagePage(imageName: "acerca_informe_pag1"),
            ImagePage(imageName: "acerca_informe_pag2"),
            ImagePage(imageName: "acerca_informe_pag3"),
            ImagePage(imageName: "acerca_informe_pag4"),
            ImagePage(imageName: "acerca_informe_pag5"),
            ]),
        
        Section(name: "Datos de contacto", pages: [
            ImagePage(imageName: "contacto_pag1"),
            ]),
        Section(name: "Contra portada", pages: [
            ImagePage(imageName: "contra_pag1"),
            ]),
        
        ]

    var showingMenu: Bool = false

    var currentIndexPath: IndexPath? {
      return collectionView.indexPathsForVisibleItems.first
    }

    weak var lastVisibleCell: PageCollectionViewCell?

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        menuConstraint = NSLayoutConstraint(item: menuContainer, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0.0)
        NSLayoutConstraint.activate([menuConstraint])
        setupMenuStackView()

        setupForIndexPath(IndexPath(item: 0, section: 0))
    }

    func setupMenuStackView() {
        for view in menuStackView.arrangedSubviews {
            view.removeFromSuperview()
        }
        
        for (index,section) in sections.enumerated() {
            let button = UIButton(type: .custom)
            button.setTitle(section.name, for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.tag = index
            button.addTarget(self, action: #selector(sectionTapped(_:)), for: .touchUpInside)
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left;
            button.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
            button.translatesAutoresizingMaskIntoConstraints = false
            menuStackView.addArrangedSubview(button)
            
            NSLayoutConstraint.activate([
                button.heightAnchor.constraint(equalToConstant: 40.0)
                ])
        }
    }
    
    @IBAction func sectionTapped(_ sender: UIButton) {
      let indexPath = IndexPath(item: 0, section: sender.tag)
      collectionView.scrollToItem(at: indexPath, at: .left, animated: false)
      view.layoutIfNeeded()
      setupForIndexPath(indexPath)
      toggleMenu(sender)
    }
        
    @IBAction func toggleMenu(_ sender: UIButton) {
        NSLayoutConstraint.deactivate([menuConstraint])
        
        if showingMenu {
            // Hide
            menuConstraint = NSLayoutConstraint(item: menuContainer, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0.0)
        }
        else {
            // Show
            menuConstraint = NSLayoutConstraint(item: menuContainer, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0.0)
        }
        
        NSLayoutConstraint.activate([menuConstraint])
        
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
        
        showingMenu = !showingMenu
    }
}

extension PageNavigationViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return sections.count
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return sections[section].pages.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PageCollectionViewCell", for: indexPath) as! PageCollectionViewCell
    
    cell.setupWithPage(sections[indexPath.section].pages[indexPath.item], insideViewController: self)

    return cell
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return collectionView.bounds.size
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
}

extension PageNavigationViewController: UIScrollViewDelegate {
  func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
    scrollInidcator.isHidden = true
    lastVisibleCell = collectionView.visibleCells.first as? PageCollectionViewCell
  }

  func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    if !decelerate { setupForCurrentPage() }
  }

  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    setupForCurrentPage()
  }

  func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
    setupForCurrentPage()
  }

  func setupForCurrentPage() {
    setupForIndexPath(currentIndexPath ?? IndexPath(item: 0, section: 0))
  }

  func setupForIndexPath(_ indexPath: IndexPath) {
    titleLabel.text = sections[indexPath.section].name

    let currentCell = collectionView.cellForItem(at: indexPath) as? PageCollectionViewCell

    if currentCell != lastVisibleCell {
      if let pageVC = lastVisibleCell?.childViewController as? PageViewController {
        pageVC.scrollView.zoomScale = 1.0
      }
    }

    if let scrollableVW = currentCell?.childViewController as? ScrollablePageViewController {
      scrollInidcator.isHidden = !scrollableVW.showsScrollIndicator
    } else {
      scrollInidcator.isHidden = true
    }

    lastVisibleCell = nil
  }
}

class PageCollectionViewCell: UICollectionViewCell {
  var page: Page?
  var childViewController: UIViewController?
  var childView: UIView?

  func setupWithPage(_ page: Page, insideViewController viewController: UIViewController) {
    self.page = page
    childViewController = page.viewController
    childView = childViewController?.view

    guard let childViewController = childViewController, let childView = childView else { return }

    viewController.addChildViewController(childViewController)
    addSubview(childView)

    childView.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      leadingAnchor.constraint(equalTo: childView.leadingAnchor),
      trailingAnchor.constraint(equalTo: childView.trailingAnchor),
      topAnchor.constraint(equalTo: childView.topAnchor),
      bottomAnchor.constraint(equalTo: childView.bottomAnchor)
    ])

    childViewController.didMove(toParentViewController: viewController)
  }

  override func prepareForReuse() {
    super.prepareForReuse()

    childViewController?.willMove(toParentViewController: nil)
    childView?.removeFromSuperview()
    childViewController?.removeFromParentViewController()

    childView = nil
    childViewController = nil
  }
}
