//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import Foundation
import UIKit


var airlines = [1,2,3,4,5,6,7,8,9]
func changePickerStart () {
            
            if let newStartIndex = airlines.airlinesArray.index(where: {$0 as Airline === pickerStartAirline}){return airlines.airlinesArray[newStartIndex] as Airline}

            
             airlinePickerView.selectRow(<#T##row: Int##Int#>, inComponent: 0, animated: false)
};

else {
            
            airlines.airlinesArray.sort(by: {$0.IATA < $1.IATA})
            airlinePickerView.selectRow(pickerNewStartIndex, inComponent: 0, animated: false)
        }



}
