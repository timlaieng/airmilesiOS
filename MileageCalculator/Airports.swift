//
//  Airports.swift
//  MileageCalculator
//
//  Created by Tim Lai on 06/09/2017.
//  Copyright © 2017 Tim Lai. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

struct Airport {
    let IATA: String
    let name: String
    let city: String
    let country: String
}

class AirportsModel: NSObject {
   
    var airportsArray: [Airport] = []
    
    func generateAirportArray() {
        if let path = Bundle.main.path(forResource: "airports", ofType: "json", inDirectory: nil, forLocalization: nil) {
            
            airportsArray.removeAll()
            
            let url = URL.init(fileURLWithPath: path)
            let dataAirlines = try! Data.init(contentsOf: url)
            let json = JSON(dataAirlines)
            
            for airlineJSON in json.dictionary! {
                
                let IATA = airlineJSON.key
                let name = airlineJSON.value["name"].stringValue
                let city = airlineJSON.value["city"].stringValue
                let country = airlineJSON.value["country"].stringValue
                
                let airportObject = Airport(IATA: IATA, name: name, city: city, country: country)
                
                airportsArray.append(airportObject)
            }
            
        }
       airportsArray = airportsArray.sorted(by: {$0.IATA < $1.IATA})
    }
    
    override init() {
        super.init()
        self.generateAirportArray()
    }
}
