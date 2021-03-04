//
//  RestaurantDetailsViewController.swift
//  Yelpy
//
//  Created by Garrett Strealy on 3/4/21.
//  Copyright © 2021 memo. All rights reserved.
//

import UIKit
import AlamofireImage

class RestaurantDetailsViewController: UIViewController {
    
    @IBOutlet weak var restaurantImage: UIImageView!
    
    var r: Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        restaurantImage.af.setImage(withURL: r.imageURL!)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
