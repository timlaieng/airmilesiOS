//
//  Response.swift
//  MileageCalculator
//
//  Created by Tim Lai on 06/10/2017.
//  Copyright © 2017 Tim Lai. All rights reserved.
//

import Foundation
import SwiftyJSON

struct ProgramResult {
    let id: String
    let programmeName: String
    let value: Int
    let airlines: [String]
}

struct ItineraryResult {
    let id: String
    let totals: [ProgramResult]
}

struct ValueResponse {
    let success: Bool
    let errorMessage: String?
    let value: ItineraryResult
}


class APIResponse {
 
    /*
    {
    "success" : true,
    "errorMessage" : null,
            "value" : [{
            "success" : true,
            "errorMessage" : null,
                    "value" : {
                        "id" : "abcdxyz",
                        "totals" : [{
                        "id": "AFB",
                        "name": "Flying Blue",
                        "value": 617,
                        "airlines": [ "A5", "AF", "KL", "KQ", "RO", "SB", "UX" ]
                        }, {
                        "id" : "DL",
                        "name" : "Delta Air Lines",
                        "value" : 766,
                        "airlines": [ "DL" ]
                        }, {
                        "id" : "VS",
                        "name" : "Virgin Atlantic",
                        "value" : 1235,
                        "airlines": [ "VS" ]
                        }, {
                        "id" : "SV",
                        "name" : "Saudi Arabian Airlines",
                        "value" : 2470,
                        "airlines": [ "SV" ]
                        }]
                    }
            }]
    }
 */
}
