//
//  CountriesTableViewController.swift
//  tableViewtP2
//
//  Created by Djimy Surlin on 3/31/24.
//

import UIKit
import Foundation
//import DetailViewController

class CountriesTableViewController: UITableViewController {
    let continents = getContinents()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Country List"
        configureItem()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return continents.count
    }
    
    private func configureItem(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self, 
            action: #selector(nextButtonTapped)
            
        )
        
    }
    @objc func nextButtonTapped() {
            // Instantiate the new view controller
            let nextViewController = NextViewController()
            let addViewController = AddViewController()
        if let secondViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "10") as? AddViewController{
            
            // Present or push the view controller
            // Example:
            // present(secondViewController, animated: true, completion: nil)
            
            // Push the new view controller onto the navigation stack
            self.navigationController?.pushViewController(secondViewController, animated: true)
        }
    }
    class NextViewController: UIViewController {
        // Your code for the next view controller
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return getCountriesInContinent(continentName: continents[section]).count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath)
        
        // Configure the cell...
        
        
        // Configure the cell...
        //cell.textLabel?.text = "Section \(indexPath.section) Row \(indexPath.row)"
        let countries = getCountriesInContinent(continentName: continents[indexPath.section])
        let country = countries[indexPath.row]
        cell.textLabel?.text = country.name
        cell.detailTextLabel?.text = country.isoCode
        cell.imageView?.image = UIImage(named: country.isoCode)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return continents[section]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let countries = getCountriesInContinent(continentName: continents[indexPath.section])
        let country = countries[indexPath.row]
        print(country)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var selectedCounrty : Country?
        if segue.identifier == "to_details_view" {
            // Get a reference to the destination view controller
                if let indexPath = tableView.indexPathForSelectedRow{
                    let countries = getCountriesInContinent(continentName: continents[indexPath.section])
                    selectedCounrty = countries[indexPath.row]
            
                }
            
            if let destinationViewController = segue.destination as? DetailViewController {
                // Perform any necessary setup
                destinationViewController.property = selectedCounrty
            }
            
        }
    }
    // Dans MainViewController.swift
    
    
    /* var selectedCountry: CountryDetail? // Le pays sélectionné
     
     // Fonction pour gérer la sélection d'un pays
     func didSelectCountry(country: CountryDetail) {
     selectedCountry = country
     performSegue(withIdentifier: "showDetail", sender: self) // Déclenche la transition vers le DetailViewController
     }
     
     //Inside your source view controller (e.g., UITableViewController)
     
     
     }
     
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     if segue.identifier == "showDetail" {
     if let detailVC = segue.destination as? DetailViewController {
     detailVC.countryDetail = selectedCountry // Passe les détails du pays au DetailViewController
     }
     }
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}
