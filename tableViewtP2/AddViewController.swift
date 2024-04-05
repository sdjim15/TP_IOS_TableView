//
//  AddViewController.swift
//  tableViewtP2
//
//  Created by Djimy Surlin on 4/4/24.
//

import UIKit

class AddViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Country"

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var IsoCode: UITextField!
    @IBOutlet weak var Continent: UITextField!
    @IBOutlet weak var CountryName: UITextField!
    @IBAction func AddNewCountry(_ sender: Any) {
        print(Continent.text!, CountryName.text!, IsoCode.text!)
        getAllCountries().append(Country(isoCode: "at", name: "Austria",continent: "Europe"))
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
