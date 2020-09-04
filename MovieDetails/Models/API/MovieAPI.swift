//
//  MovieAPI.swift
//  MovieDetails
//
//  Created by Luna Abreu on 03/09/20.
//  Copyright © 2020 Luna IOS1. All rights reserved.
//

import Foundation
import Alamofire

class MovieAPI {
    
    
    fileprivate init() {
        
        
    }
    
    
    /* **************************************************************************************************
     **
     **  MARK: get movie details
     **
     ****************************************************************************************************/
    
    static func getMovieDetails(callback: @escaping (ServerResponse) -> Void) {
        
        let newURL = API.host + API.movie + "603?api_key=" + API.key
        
        print ("request - movieDetails")
        print (newURL)
        
        Alamofire.request(newURL,
                          method : HTTPMethod.get,
                          parameters : nil,
                          encoding : URLEncoding.default,
                          headers : nil
        ).responseJSON(completionHandler : { response in
            
            let resposta = ServerResponse()
            
            print ("Response - movieDetails")
            
            print (response.result)
            
            switch response.result {
                
            case let .success(value):
                resposta.statusCode = response.response?.statusCode ?? 0
                
                print(resposta.statusCode)
                
                if response.response?.statusCode == 200 {
                    
                    resposta.movie = DAOMovie.transformJSONInMovie(value as AnyObject)
                    resposta.success = true
                    
                    callback(resposta)
                    
                    return
                    
                }
                
                callback (resposta)
                
                return
                
            case let .failure(error):
                print (error)
            }
            
            resposta.success = false
            resposta.erroMessage = "Error loading movie"
            
            callback (resposta)
            
        })
        
    }
    
    /* **************************************************************************************************
     **
     **  MARK: get similar movie
     **
     ****************************************************************************************************/
    
    static func getSimilarMovies(callback: @escaping (ServerResponse) -> Void) {
        
        let newURL = API.host + API.movie + "603/similar?api_key=" + API.key
        
        print ("request - getSimilarMovies")
        print (newURL)
        
        Alamofire.request(newURL,
                          method : HTTPMethod.get,
                          parameters : nil,
                          encoding : URLEncoding.default,
                          headers : nil
        ).responseJSON(completionHandler : { response in
            
            let resposta = ServerResponse()
            
            print ("Response - getSimilarMovies")
            
            print (response.result)
            
            switch response.result {
                
            case let .success(value):
                resposta.statusCode = response.response?.statusCode ?? 0
                
                print(resposta.statusCode)
                
                if response.response?.statusCode == 200 {
                    
                    let JSON = value as AnyObject
                    
                    if let info = JSON["results"] as? [[String : Any]] {
                        
                        resposta.movies = DAOMovie.transformJSONInArrayMovie(info as AnyObject)
                        
                        resposta.success = true
                        
                    }
                    
                    callback (resposta)
                    
                    return
                    
                }
                
            case let .failure(error):
                print (error)
                
            }
            
            resposta.success = false
            resposta.erroMessage = "Error loading movies"
            
            callback (resposta)
            
        })
        
    }
    
}
