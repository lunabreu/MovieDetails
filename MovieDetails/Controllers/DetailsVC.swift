//
//  ViewController.swift
//  MovieDetails
//
//  Created by Luna Abreu on 03/09/20.
//  Copyright © 2020 Luna IOS1. All rights reserved.
//


import UIKit
import SDWebImage

class DetailsVC : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    /* *************************************************************************************
     **
     **  MARK: Variables desclaration
     **
     ***************************************************************************************/
    
    var detailsView : DetailsView!
    
    var movie : Movie!
    
    var movies : [Movie] = []
    
    /* **************************************************************************************************
     **
     **  MARK: View
     **
     ****************************************************************************************************/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailsView = DetailsView(view: view, parent: self)
        
        //--------------------------- table View Delegate --------------------------------
        
        detailsView.tableView.delegate = self
        detailsView.tableView.dataSource = self
        detailsView.tableView.register(MovieCell.self, forCellReuseIdentifier: "MovieCell")
        
        setInfo()
        
    }
    
    /* *************************************************************************************
     **
     **  MARK: set info
     **
     ***************************************************************************************/
    
    func setInfo() {
        
        self.startLoading()
        
        MovieAPI.getMovieDetails {(response) in
            
            self.stopLoading()
            
            if response.success {
                
                self.movie = response.movie
                
                self.detailsView.titleLabel.text = self.movie.title
                
                self.detailsView.likesNumber.text = self.movie.voteAverage.description + " Likes"
                
                self.detailsView.watchedLabel.text = self.movie.popularity.description + " Views" 
                
                DispatchQueue.main.async {
                    
                    let url = URL (string: API.imageBaseURL + self.movie.poster)
                    
                    if url != nil {
                        
                        self.detailsView.imageView.sd_setImage(with: url, completed: nil)
                        
                    }
                }
                
                
            } else {
                
                GenericAlert.genericAlert(self, title: "Error while showing movie", message: "", actions: [])
                
            }
            
            
        }
        
        self.startLoading()
        
        MovieAPI.getSimilarMovies {(response) in
            
            self.stopLoading()
            
            if response.success {
                
                self.movies = response.movies
                
                self.detailsView.tableView.reloadData()
                
                DispatchQueue.main.async {
                    
                    let url = URL (string: API.imageBaseURL + self.movie.poster)
                    
                    if url != nil {
                        
                        self.detailsView.imageView.sd_setImage(with: url, completed: nil)
                        
                    }
                }
                
                
            } else {
                
                GenericAlert.genericAlert(self, title: "Error while showing movies", message: "", actions: [])
                
            }
            
        }
        
    }
    
    /* **************************************************************************************************
     **
     **  MARK: TableView
     **
     ****************************************************************************************************/
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return movies.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        cell.selectionStyle = .none
        
        cell.titleLabel.text = self.movies[indexPath.row].title
        
        cell.yearLabel.text = self.movies[indexPath.row].releaseDate
        
        cell.genreLabel.text = "Action, Science Fiction"
        
        DispatchQueue.main.async {
            
            let url = URL (string: API.imageBaseURL + self.movies[indexPath.row].poster)
            
            if url != nil {
                
                cell.movieImage.sd_setImage(with: url, completed: nil)
                
            }
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 150
        
    }
    
}


