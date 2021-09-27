//
//  SlideImageCell.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/22/21.
//

import UIKit
import ImageSlideshow
import SDWebImage

protocol SlideImageCellView {
    func cellConfigure(model: [Slide])
}

class SlideImageCell: UITableViewCell, SlideImageCellView {
    
    @IBOutlet weak var imageSlideShow: ImageSlideshow!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        configureSlideImage()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func configureSlideImage() {
        imageSlideShow.contentScaleMode = .scaleAspectFill
        let pageIndicator = UIPageControl()
        pageIndicator.currentPageIndicatorTintColor = #colorLiteral(red: 0.9529411765, green: 0.5725490196, blue: 0.1450980392, alpha: 1)
        pageIndicator.pageIndicatorTintColor = .white
        imageSlideShow.pageIndicatorPosition = PageIndicatorPosition(horizontal: .center, vertical: .bottom)
        imageSlideShow.pageIndicator = pageIndicator
        imageSlideShow.slideshowInterval = 3
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapImageSlider))
        imageSlideShow.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc private func didTapImageSlider() {
        
    }
    
    func cellConfigure(model: [Slide]) {
        let first = model[0].image
        let secound = model[1].image
        let third = model[2].image
        imageSlideShow.setImageInputs([
            SDWebImageSource(url: first!),
            SDWebImageSource(url: secound!),
            SDWebImageSource(url: third!)
        ])
    }
    
    
}
