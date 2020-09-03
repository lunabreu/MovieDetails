//
//  ViewController.swift
//  MovieDetails
//
//  Created by Luna Abreu on 03/09/20.
//  Copyright © 2020 Luna IOS1. All rights reserved.
//

import UIKit

class DetailsVC : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    /* *************************************************************************************
     **
     **  MARK: Variables desclaration
     **
     ***************************************************************************************/
    
    var detailsView : DetailsView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailsView = DetailsView(view: view, parent: self)
        
        //--------------------------- table View Delegate --------------------------------
        
        detailsView.tableView.delegate = self
        detailsView.tableView.dataSource = self
        
    }
    
    /* **************************************************************************************************
     **
     **  MARK: TableView
     **
     ****************************************************************************************************/
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = MovieCell(view: view)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 150
        
        
    }
    
}

