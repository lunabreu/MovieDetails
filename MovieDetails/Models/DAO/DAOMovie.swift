//
//  DAOMovie.swift
//  MovieDetails
//
//  Created by Luna Abreu on 03/09/20.
//  Copyright © 2020 Luna IOS1. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DAOMovie {
    
    fileprivate init() {
        
    }
    
    static func transformJSONInArrayMovie(_ JSON : AnyObject) -> [Movie] {
        
        var array : [Movie] = []
        
        guard let data = JSON as? NSArray else {
            return array
        }
        
        for item in data {
            
            array.append(transformJSONInMovie(item as AnyObject))
            
        }
        
        
        return array
        
    }
    
    static func transformJSONInMovie(_ JSON : AnyObject) -> Movie {
        
        let movie = Movie()
        
        if let info = JSON["movie_id"] as? Int {
            movie.movieId = info
        }
        
        if let info = JSON["title"] as? String {
            movie.title = info
        }
        
        if let info = JSON["popularity"] as? CGFloat {
            movie.popularity = info
        }
        
        if let info = JSON["vote_average"] as? CGFloat {
            movie.voteAverage = info
        }
        
        if let info = JSON["poster_path"] as? String {
            movie.poster = info
        }
        
        if let info = JSON["release_date"] as? String {
            movie.releaseDate = info
            
            let dateFormatterGet = DateFormatter()
            dateFormatterGet.dateFormat = "yyyy-MM-dd"
            
            let dateFormatterPrint = DateFormatter()
            dateFormatterPrint.dateFormat = "yyyy"
            
            if let date = dateFormatterGet.date(from : info) {
                
                movie.releaseDate = dateFormatterPrint.string(from : date)
                
            } else {
                
                print("There was an error decoding the string")
                
            }
            
        }
        
        return movie
        
    }
    
}



