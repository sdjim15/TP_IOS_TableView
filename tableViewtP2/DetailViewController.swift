//
//  DetailViewController.swift
//  tableViewtP2
//
//  Created by Djimy Surlin on 3/31/24.
//

import UIKit




class DetailViewController: UIViewController {
    var property : Country?
    @IBOutlet weak var Country_Name: UILabel!
    
    @IBOutlet weak var Continent: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        title = "Country Details"
    }
    override func viewWillAppear(_ animated: Bool) {
        Country_Name.text = property?.name
        Continent.text = property?.continent
        image?.image = UIImage(named: property!.isoCode)
        
    }
    

}
