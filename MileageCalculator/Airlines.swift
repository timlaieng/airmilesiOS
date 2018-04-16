//
//  Airlines.swift
//  MileageCalculator
//
//  Created by Tim Lai on 05/09/2017.
//  Copyright © 2017 Tim Lai. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

struct Airline: Equatable {
    static func ==(lhs: Airline, rhs: Airline) -> Bool {
        if lhs.IATA == rhs.IATA && lhs.name == rhs.name {
            return true
        }
        return false
    }
    
    let IATA: String
    let name: String
   
    
    
// maybe have scope for an alliance later on
//    let alliance: String?
}



class AirlinesModel: NSObject, UIPickerViewDataSource {
    
    var airlinesArray: [Airline] = []
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return airlinesArray.count
    }

    
    func generateAirlineArray() {
        if let path = Bundle.main.path(forResource: "airlines", ofType: "json", inDirectory: nil, forLocalization: nil) {
            
            airlinesArray.removeAll()
            
            let url = URL.init(fileURLWithPath: path)
            let dataAirlines = try! Data.init(contentsOf: url)
            let json = JSON(dataAirlines)
            
            for airlineJSON in json.arrayValue {
                
                let IATA = airlineJSON[" IATA"].stringValue
                let name = airlineJSON["Airline"].stringValue
                
                let airlineObject = Airline(IATA: IATA, name: name)
                
                airlinesArray.append(airlineObject)
            }
        }
    }
    
    override init() {
        super.init()
        self.generateAirlineArray()
    }
    
    
}
