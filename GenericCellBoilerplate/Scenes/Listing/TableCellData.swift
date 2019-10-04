//
//  TableCellData.swift
//  GenericCellBoilerplate
//
//  Created by Seyhun Akyürek on 04/10/2019.
//  Copyright © 2019 Seyhun Akyürek. All rights reserved.
//

import Foundation

// let models = try JSONDecoder().decode([CellDataEnvelope].self, from: Data(json.utf8))

// MARK - CellDataEnvelope
struct CellDataEnvelope: Decodable {
  let data: CellData?
  let type: CellDataType

  enum CellDataType: String, Decodable {
    case company
    case person
    case song
    case vehicle
  }
}

struct CellData: Decodable {
  let title: String
  let subTitle: String
  let image: String

  enum CodingKeys: CodingKey {
    // title
    case name
    // subTitle
    case sector
    case occupation
    case singer
    case brand
    // image
    case thumbnail
    case picture
    case logo
    case photo
  }
}

extension CellData {
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.title = try container.decode(String.self, forKey: .name)
    self.subTitle = try tryDecodeString(in: container, keys: [.sector, .occupation, .singer, .brand])
    self.image = try tryDecodeString(in: container, keys: [.thumbnail, .picture, .logo, .photo])
  }
}

private func tryDecodeString(
  in container: KeyedDecodingContainer<CellData.CodingKeys>,
  keys: [CellData.CodingKeys]) throws -> String {
    
  for key in keys {
    if let value = try? container.decodeIfPresent(String.self, forKey: key) {
      return value
    }
  }

  throw DecodingError.dataCorrupted(
    .init(
      codingPath: [],
      debugDescription: "Invalid data"
    )
  )
}
