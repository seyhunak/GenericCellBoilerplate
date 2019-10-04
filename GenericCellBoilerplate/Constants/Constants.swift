//
//  Constants.swift
//  GenericCellBoilerplate
//
//  Created by Seyhun Akyürek on 03/09/2019.
//  Copyright © 2019 Seyhun Akyürek. All rights reserved.
//

import Foundation

struct Api {
    static let baseURL = "http://www.mocky.io/v2/5d97ad3d3b00007400c317b4"
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}

struct List {
    static let Title = "Listing Items"
}
