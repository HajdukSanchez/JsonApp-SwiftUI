//
//  Address.swift
//  JsonApp
//
//  Created by Jozek Hajduk on 20/08/24.
//

import Foundation

struct Address : Codable {
    var street : String
    var geoLocation : GeoLocation
}
