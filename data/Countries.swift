//
//  Countries.swift
//  tableViewtP2
//
//  Created by Djimy Surlin on 3/31/24.
//

import Foundation
let countries = [
    Country(isoCode: "at", name: "Austria",continent: "Europe"),
    Country(isoCode: "be", name: "Belgium",continent: "Europe"),
    Country(isoCode: "de", name: "Germany",continent: "Europe"),
    Country(isoCode: "el", name: "Greece",continent: "Europe"),
    Country(isoCode: "fr", name: "France",continent: "Europe"),
    Country(isoCode: "ht", name: "Haiti",continent: "Amerique"),
    Country(isoCode: "us", name: "USA",continent: "Amerique"),
]
func groupContinents() -> [String:[Country]]{
   return Dictionary(grouping: countries, by: { $0.continent })
}
func getContinents() ->[String]{
    return  groupContinents().map{$0.key}
}
func getCountriesInContinent(continentName:String) ->[Country]{
   return  groupContinents()[continentName]!
    
}
