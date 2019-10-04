//
//  TableRouter.swift
//  GenericCellBoilerplate
//
//  Created by Seyhun Akyürek on 03/09/2019.
//  Copyright © 2019 Seyhun Akyürek. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    case fetch
    
    private var method: HTTPMethod {
        switch self {
        case .fetch:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .fetch:
            return "/"
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .fetch:
            return nil
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try Api.baseURL.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
}
