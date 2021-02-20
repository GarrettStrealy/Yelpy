//
//  ViewController.swift
//  Yelpy
//
//  Created by Memo on 2/19/21.
//  Copyright © 2020 memo. All rights reserved.
//

import UIKit
import AlamofireImage

class RestaurantsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Add storyboard Items (i.e. tableView + Cell + configurations for Cell + cell outlets)
    // Next, place TableView outlet here
    @IBOutlet weak var tableView: UITableView!
    
    
    // Initialize restaurantsArray
    var restaurantsArray: [[String:Any?]] = []
    
    
    // Add tableView datasource + delegate
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 150
        
        getAPIData()
    }
    
    
    // Get data from API helper and retrieve restaurants
    func getAPIData() {
        API.getRestaurants() { (restaurants) in
            guard let restaurants = restaurants else {
                return
            }
        
            self.restaurantsArray = restaurants
            self.tableView.reloadData()
        }
    }
    
    // Create tableView Extension and TableView Functionality
    // Protocol Stubs
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantsArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create Restaurant Cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell") as! RestaurantCell
        
        let restaurant = restaurantsArray[indexPath.row]
        
        // Set Label to restaurant name for each cell
        cell.label.text = restaurant["name"] as? String ?? ""
        
        // Set restaurantImage
        // 1. Get the image url string from the restaurant dictionary
        // 1. Make sure it is not "nil" before unwrapping (if let)
        if let imageUrlString = restaurant["image_url"] as? String {
            // 2. Get the convert url string –> url
            let imageUrl = URL(string: imageUrlString)
            // 3. Set image using the image url with AlamofireImage
            cell.restaurantImage.af.setImage(withURL: imageUrl!)
        }
        
        return cell
    }
}


