//
//  MainHomeViewController.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import UIKit
import SDWebImage
import ImageSlideshow
import SideMenu

final class MainHomeViewController: UIViewController {
    
    // MARK: - Properties
    
    var configurator = MainHomeConfiguratorImplementation()
    
    var presenter: MainHomePresenter?
    
    var sideMenu: SideMenuNavigationController?
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var searchTxtField: UITextField!
    @IBOutlet weak var imageSlide: ImageSlideshow!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var offerCollectionView: UICollectionView!
    @IBOutlet weak var randomCategoryImage: UIImageView!
    @IBOutlet weak var randomNameLabel: UILabel!
    @IBOutlet weak var randomDiscriptionLabel: UILabel!
    
    // MARK: - UIViewController Events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(MainHomeViewController: self)
        DispatchQueue.main.async {
            self.presenter?.viewDidLoad()
        }
        configureCollection()
        configureSlideImage()
        configureSideMenu()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        tabBarController?.tabBar.isHidden = false
    }
    
    // MARK: - Helper Functions
    
    private func configureCollection() {
        categoryCollectionView.register(UINib(nibName: "CategoryCell", bundle: nil),
                                        forCellWithReuseIdentifier: "CategoryCell")
        offerCollectionView.register(UINib(nibName: "OfferCell", bundle: nil),
                                     forCellWithReuseIdentifier: "OfferCell")
    }
    
    private func configureSlideImage() {
        imageSlide.contentScaleMode = .scaleAspectFill
        let pageIndicator = UIPageControl()
        pageIndicator.currentPageIndicatorTintColor = #colorLiteral(red: 0.9529411765, green: 0.5725490196, blue: 0.1450980392, alpha: 1)
        pageIndicator.pageIndicatorTintColor = .white
        imageSlide.pageIndicatorPosition = PageIndicatorPosition(horizontal: .center, vertical: .bottom)
        imageSlide.pageIndicator = pageIndicator
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapImageSlider))
        imageSlide.addGestureRecognizer(gestureRecognizer)
    }
    
    private func configureSideMenu() {
        let homeStoryboard = Storyboard.homeSrotyboard
        let vc: SideMenuViewController = homeStoryboard.instantiateViewController()
        sideMenu = SideMenuNavigationController(rootViewController: vc)
        sideMenu?.alwaysAnimate = true
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        sideMenu?.leftSide = true
        sideMenu?.menuWidth = self.view.width - 90
    }
    
    // MARK: - IBActions
    
    @objc private func didTapImageSlider() {
        imageSlide.presentFullScreenController(from: self)
    }
    
    @IBAction func sideMenuWasTapped(_ sender: UIButton) {
        present(sideMenu!, animated: true, completion: nil)
    }
    
    @IBAction func favBtnWasTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func cartBtnWasTapped(_ sender: UIButton) {
        presenter?.goToCart()
    }
    
    @IBAction func showAllWasTapped(_ sender: UIButton) {
        
    }
    
}

// MARK: - UICollectionViewDelegate and DataSource

extension MainHomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let tag = collectionView.tag
        switch tag {
        case 0:
            return presenter?.numberOfCategories() ?? 0
        case 1:
            return presenter?.numberOfProducts() ?? 0
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let tag = collectionView.tag
        
        switch tag {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as? CategoryCell else { return UICollectionViewCell() }
            presenter?.configure(cell: cell, forRow: indexPath.row)
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OfferCell", for: indexPath) as? OfferCell else { return UICollectionViewCell() }
            presenter?.configure(cell: cell, forRow: indexPath.row)
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let tag = collectionView.tag
        
        switch tag {
        case 0:
            presenter?.deSelectCategory(at: indexPath.row)
        case 1:
            presenter?.deSelectProduct(at: indexPath.row)
        default:
            print("non")
        }
    }
}

// MARK: - MainHomeView

extension MainHomeViewController: MainHomeView {
    func reloadCollectionData() {
        self.categoryCollectionView.reloadData()
        self.offerCollectionView.reloadData()
    }
    
    func reloadRandomCategory(model: HomeCategory) {
        self.randomCategoryImage.sd_setImage(with: model.image, completed: nil)
        self.randomNameLabel.text = model.name
        self.randomDiscriptionLabel.text = model.categoryDescription
    }
    
    func reloadImageSlides(slide: [Slide]) {
        let first = slide[0].image
        let secound = slide[1].image
        let third = slide[2].image
        imageSlide.setImageInputs([
            SDWebImageSource(url: first!),
            SDWebImageSource(url: secound!),
            SDWebImageSource(url: third!)
        ])
    }
}
