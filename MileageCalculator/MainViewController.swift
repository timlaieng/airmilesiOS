//
//  MainViewController.swift
//  MileageCalculator
//
//  Created by Tim Lai on 04/09/2017.
//  Copyright © 2017 Tim Lai. All rights reserved.
//

import Foundation
import UIKit
//import Alamofire
//import SwiftyJSON
//import RealmSwift

class MainViewController: UIViewController, UIPickerViewDelegate {
    
    
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var airlinePickerView: UIPickerView!
    @IBOutlet weak var pickerTitleSegmentedControl: UISegmentedControl!
    @IBOutlet weak var searchHistoryButton: UIButton!
    @IBOutlet weak var departureAirportButton: UIButton!
    @IBOutlet weak var arrivalAirportButton: UIButton!
    @IBOutlet weak var fareClassButton: UIButton!
    
    
    let airlines = AirlinesModel()
    let airports = AirportsModel()
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        if pickerTitleSegmentedControl.selectedSegmentIndex == 0 {
            return airlines.airlinesArray[row].name
        } else {
            return airlines.airlinesArray[row].IATA
        }
        
    }
    
    @IBAction func segmentedControlSwitched(_ sender: UISegmentedControl) {
        
        
        var pickerNewStartIndex = airlinePickerView.selectedRow(inComponent: 0)
        let pickerStartAirline = airlines.airlinesArray[pickerNewStartIndex]
        
        if pickerTitleSegmentedControl.selectedSegmentIndex == 0 {
            airlines.airlinesArray.sort(by: {$0.name < $1.name})
            
            pickerNewStartIndex = airlines.airlinesArray.index(of: pickerStartAirline)!
            airlinePickerView.selectRow(pickerNewStartIndex, inComponent: 0, animated: false)
            
        } else {
            
            airlines.airlinesArray.sort(by: {$0.IATA < $1.IATA})
            
            pickerNewStartIndex = airlines.airlinesArray.index(of: pickerStartAirline)!
            airlinePickerView.selectRow(pickerNewStartIndex, inComponent: 0, animated: false)
            
        }
        
        airlinePickerView.reloadAllComponents()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        airlinePickerView.dataSource = airlines
        airlinePickerView.delegate = self
        pickerTitleSegmentedControl.selectedSegmentIndex = 0
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false    
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    

    
    
   
    
}

