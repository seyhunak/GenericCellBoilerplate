//
//  TableClient.swift
//  GenericCellBoilerplate
//
//  Created by Seyhun Akyürek on 03/09/2019.
//  Copyright © 2019 Seyhun Akyürek. All rights reserved.
//

import Foundation
import Alamofire

class TableClient {
    @discardableResult
    private static func performRequest<T:Decodable>(route: APIRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T,Error>)->Void) -> DataRequest {
        decoder.keyDecodingStrategy = .useDefaultKeys
        return AF.request(route)
            .validate(statusCode: 200..<300)
            .responseDecodable (decoder: decoder){ (response: DataResponse<T>) in
            completion(response.result)
        }
    }
    
    static func fetch(completion:@escaping (Result<Table,Error>)->Void) {
        performRequest(route: APIRouter.fetch, completion: completion)
    }
    
}
