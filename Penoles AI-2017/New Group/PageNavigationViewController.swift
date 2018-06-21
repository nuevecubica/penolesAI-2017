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
            CoverPage(theBg: "cover_bg", theFront: "cover_title", theTitle: "cover_front"),
            ]),
        Section(name: "Perfil corporativo", pages: [
            ImagePage(imageName: "perfil_corp_pag1"),
            ImagePage(imageName: "perfil_corp_pag2"),
            MapPage(),
            ]),
        Section(name: "Modelo de negocio", pages: [
            ImagePage(imageName: "modelo_pag1"),
            modelo_negocio_3Page(imageName: "modelo_pag2"),
            ImagePage(imageName: "modelo_pag3"),
            ImagePage(imageName: "modelo_pag4"),
            ]),
        Section(name: "Informe anual", pages: [
            ImagePage(imageName: "inf_anual_pag1"),
            ]),
        Section(name: "Informe del Director", pages: [
            ImagePage(imageName: "inf_director_pag1"),
            ]),
        Section(name: "Resumen de operaciones", pages: [
            CoverPage(theBg: "ro_cover_bg", theFront: "ro_cover_title", theTitle: "ro_cover_front"),
            ImagePage(imageName: "res_operacion_pag1"),
            ImagePage(imageName: "res_operacion_pag2"),
            ImagePage(imageName: "res_operacion_pag3"),
            ImagePage(imageName: "res_operacion_pag4"),
            ImagePage(imageName: "res_operacion_pag5"),
            res_operacion_6Page(imageName: "res_operacion_pag6"),
            res_operacion_7Page(imageName: "res_operacion_pag7"),
            res_operacion_8Page(imageName: "res_operacion_pag8"),
            ImagePage(imageName: "res_operacion_pag9"),
            ImagePage(imageName: "res_operacion_pag10"),
            ImagePage(imageName: "res_operacion_pag11"),
            ImagePage(imageName: "res_operacion_pag12"),
            ImagePage(imageName: "res_operacion_pag13"),
            res_operacion_14Page(imageName: "res_operacion_pag14"),
            res_operacion_15Page(imageName: "res_operacion_pag15"),
            ImagePage(imageName: "res_operacion_pag16"),
            ImagePage(imageName: "res_operacion_pag17"),
            ImagePage(imageName: "res_operacion_pag18"),
            res_operacion_19Page(imageName: "res_operacion_pag19"),
            res_operacion_20Page(imageName: "res_operacion_pag20"),
            ImagePage(imageName: "res_operacion_pag21"),
            
            ]),
        Section(name: "Energía y Tecnológica", pages: [
            CoverPage(theBg: "et_cover_bg", theFront: "et_cover_front", theTitle: "et_cover_title"),
            ImagePage(imageName: "energia_tec_pag1"),
            ImagePage(imageName: "energia_tec_pag2"),
            ]),
        Section(name: "Nuestra gente", pages: [
            CoverPage(theBg: "ng_cover_bg", theFront: "ng_cover_front", theTitle: "ng_cover_title"),
            ImagePage(imageName: "nuestra_gente_pag1"),
            ]),
        Section(name: "Gobierno corporativo", pages: [
            CoverPage(theBg: "gc_cover_bg", theFront: "gc_cover_front", theTitle: "gc_cover_title"),
            ImagePage(imageName: "gob_corp_pag1"),
            ImagePage(imageName: "gob_corp_pag2"),
            ]),
        Section(name: "Equipo directivo", pages: [
            ImagePage(imageName: "ejecutivos_pag1"),
            ]),
        Section(name: "Consejo de Administración", pages: [
            ImagePage(imageName: "consejo_admon_pag1"),
            ]),
        Section(name: "Análisis y discusión de resultados ", pages: [
            ImagePage(imageName: "analisis_res_pag1"),
            ImagePage(imageName: "analisis_res_pag2"),
            ImagePage(imageName: "analisis_res_pag3"),
            ImagePage(imageName: "analisis_res_pag4"),
            ImagePage(imageName: "analisis_res_pag5"),
            ImagePage(imageName: "analisis_res_pag6"),
            ImagePage(imageName: "analisis_res_pag7"),
            ImagePage(imageName: "analisis_res_pag8"),
            ]),
        Section(name: "Informe del comite de auditoría", pages: [
            ImagePage(imageName: "inf_comite_pag1"),
            ]),
        Section(name: "Información para accionistas", pages: [
            ImagePage(imageName: "inf_accionistas_pag1"),
            ]),
        Section(name: "Contra portada", pages: [
            ImagePage(imageName: "back_cover"),
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
