//
//  MovieCell.swift
//  MovieDetails
//
//  Created by Luna Abreu on 03/09/20.
//  Copyright © 2020 Luna IOS1. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    /* **************************************************************************************************
     **
     **  MARK: Variables desclaration
     **
     ****************************************************************************************************/
    
    var movieImage : UIImageView!
    
    var titleLabel : UILabel!
    
    var yearLabel : UILabel!
    
    var genreLabel : UILabel!
    
    /* **************************************************************************************************
     **
     **  MARK: Init
     **
     ****************************************************************************************************/
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear
        
        let width = UIScreen.main.bounds.width
        
        //------------------------Image View-----------------------------
        
        movieImage = UIImageView(frame: CGRect(x: width * 0.05, y: 10, width: width * 0.2, height: 125))
        movieImage.contentMode = .scaleAspectFit
        movieImage.clipsToBounds = true
        movieImage.backgroundColor = .clear
        
        addSubview(movieImage)
        
        //-------------------Title Label-------------------------------
        
        titleLabel = UILabel(frame: CGRect(x: width*0.05, y: 0, width: width*0.7, height: 20))
        titleLabel.font = UIFont.defaultFont(size: 18, type: .regular)
        titleLabel.text = "Lorem ipsum"
        titleLabel.numberOfLines = 0
        titleLabel.frame.origin.x = movieImage.frame.origin.x + movieImage.frame.width + 5
        titleLabel.frame.origin.y = movieImage.center.y - 10
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textColor = .white
        
        addSubview(titleLabel)
        
        //-------------------Year Label-------------------------------
        
        yearLabel = UILabel(frame: CGRect(x: width*0.05, y: 0, width: width*0.1, height: 20))
        yearLabel.font = UIFont.defaultFont(size: 16, type: .light)
        yearLabel.text = "1994"
        yearLabel.frame.origin.x = movieImage.frame.origin.x + movieImage.frame.width + 5
        yearLabel.frame.origin.y = movieImage.center.y + 10
        yearLabel.adjustsFontSizeToFitWidth = true
        yearLabel.textColor = .white
        
        addSubview(yearLabel)
        
        //-------------------Genre Label-------------------------------
        
        genreLabel = UILabel(frame: CGRect(x: width*0.05, y: 0, width: width*0.6, height: 20))
        genreLabel.font = UIFont.defaultFont(size: 16, type: .light)
        genreLabel.text = "Lorem ipsum"
        genreLabel.frame.origin.x = yearLabel.frame.origin.x + yearLabel.frame.width + 5
        genreLabel.frame.origin.y = movieImage.center.y + 10
        genreLabel.textColor = .white
        
        addSubview(genreLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
