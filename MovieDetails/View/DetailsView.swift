//
//  DetailsView.swift
//  MovieDetails
//
//  Created by Luna Abreu on 03/09/20.
//  Copyright © 2020 Luna IOS1. All rights reserved.
//

import Foundation
import UIKit

protocol DetailsViewDelegate {
    
    func likeButtonAction()
    
}

class DetailsView : UIView {
    
    /* *****************************************************************************
     **
     **  MARK: Variables declaration
     **
     *******************************************************************************/
    
    var scrollView: UIScrollView!
    
    var imageView : UIImageView!
    
    var backButton : UIButton!
    
    var titleLabel : UILabel!
    
    var likeButton : UIButton!
    
    var delegate : DetailsViewDelegate!
    
    var likeImage : UIImageView!
    
    var likesNumber : UILabel!
    
    var watchedLabel : UILabel!
    
    var tableView : UITableView!
    
    
    /* ******************************************************************************
     **
     **  MARK: Init
     **
     ********************************************************************************/
    
    init(view: UIView, parent: UIViewController) {
        super.init(frame: view.frame);
        
        let width = view.frame.size.width
        let height = view.frame.size.height
        
        view.backgroundColor = .black
        
        //------------------------- Scroll View -----------------------------
        
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        scrollView.isScrollEnabled = true
        scrollView.contentInsetAdjustmentBehavior = .never
        
        view.addSubview(scrollView)
        
        //------------------------Image View-----------------------------
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height*0.475))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .white
        
        scrollView.addSubview(imageView)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = imageView.frame
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        
        imageView.layer.insertSublayer(gradientLayer, at: 0)
        
        //-------------------- Back Button --------------------------------
        
        backButton = UIButton(frame: CGRect(x: width*0.05, y: width*0.15, width: 20, height: 20))
        backButton.setImage(UIImage(named: "back"), for: .normal)
        backButton.imageView?.contentMode = .scaleAspectFit
        
        scrollView.addSubview(backButton)
        
        //-------------------Title Label-------------------------------------
        
        titleLabel = UILabel(frame: CGRect(x: width*0.05, y: 0, width: width*0.5, height: 55))
        titleLabel.font = UIFont.defaultFont(size: 22, type: .bold)
        titleLabel.text = "Lorem ipsum"
        titleLabel.numberOfLines = 0
        titleLabel.frame.origin.y = imageView.frame.origin.y + height * 0.49
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textColor = .white
        
        scrollView.addSubview(titleLabel)
        
        //-------------------Like Button----------------------------------
        
        likeButton = UIButton(frame: CGRect(x: width * 0.85, y: 0, width: 40, height: 40))
        likeButton.frame.origin.y = titleLabel.frame.origin.y
        likeButton.setImage(UIImage (named: "unlikedButton")?.withTintColor(UIColor.white), for: .normal)
        likeButton.imageView?.contentMode = .scaleAspectFill
        likeButton.addTarget(self, action: #selector(likeButtonAction), for: .touchUpInside)
        
        scrollView.addSubview(likeButton)
        
        //------------------------Like Image-----------------------------
        
        likeImage = UIImageView(frame: CGRect(x: width * 0.05, y: 0, width: 15, height: 15))
        likeImage.contentMode = .scaleAspectFill
        likeImage.clipsToBounds = true
        likeImage.frame.origin.y = titleLabel.frame.origin.y + titleLabel.frame.height + 5
        likeImage.image = UIImage (named: "unlikedButton")?.withTintColor(UIColor.white)
        
        scrollView.addSubview(likeImage)
        
        //-------------------Likes Number-------------------------------------
        
        likesNumber = UILabel(frame: CGRect(x: 0, y: 0, width: width*0.3, height: 25))
        likesNumber.font = UIFont.defaultFont(size: 18, type: .light)
        likesNumber.text = "Lorem ipsum"
        likesNumber.numberOfLines = 0
        likesNumber.center.y = likeImage.center.y
        likesNumber.frame.origin.x = likeImage.frame.origin.x + likeImage.frame.width + 5
        likesNumber.textColor = .white
        
        scrollView.addSubview(likesNumber)
        
        //-------------------Likes Number-------------------------------------
        
        watchedLabel = UILabel(frame: CGRect(x: 0, y: 0, width: width*0.4, height: 25))
        watchedLabel.font = UIFont.defaultFont(size: 18, type: .light)
        watchedLabel.text = "Lorem ipsum"
        watchedLabel.center.y = likeImage.center.y
        watchedLabel.frame.origin.x = likesNumber.frame.origin.x + likesNumber.frame.width + 10
        watchedLabel.textColor = .white
        
        scrollView.addSubview(watchedLabel)
        
        var yPosition = watchedLabel.frame.origin.y + watchedLabel.frame.height + 5
        
        //------------------------- Table View -----------------------------
        
        tableView = UITableView(frame: CGRect(x: 0, y: yPosition, width: width, height: height * 0.42))
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        
        scrollView.addSubview(tableView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /* **************************************************************************************************
     **
     **  MARK: Like Button Action
     **
     ****************************************************************************************************/
    
    @objc func likeButtonAction() {
        
        if likeButton.imageView?.image == UIImage (named: "unlikedButton")?.withTintColor(UIColor.white) {
            
            likeButton.setImage(UIImage(named: "likedButton"), for: .normal)
            
        } else {
            
            likeButton.setImage(UIImage(named: "unlikedButton")?.withTintColor(UIColor.white), for: .normal)
            
        }
        
        if delegate != nil {
            
            delegate.likeButtonAction()
            
        }
    }
}

