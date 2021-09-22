//
//  URLRequest.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import Alamofire

typealias completion<T: Codable> = (Result<T, AFError>) -> Void

protocol URLRequestBuilder: URLRequestConvertible {
    
    var mainURL: URL { get }
    
    var requestURL: URL { get }
    
    var path: String { get }
    
    var parameters: Parameters? { get }
    
    var headers:HTTPHeaders { get }
    
    var method: HTTPMethod { get }
    
    var encoding: ParameterEncoding { get }
    
    var urlRequest: URLRequest { get }
}

extension URLRequestBuilder {
    
    var encoding: ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
    var mainURL: URL {
        return URL(string: "https://aldakhil.4hoste.com/api/")!
    }
    
    var requestURL: URL {
        return mainURL.appendingPathComponent(path)
    }
    
    var headers:HTTPHeaders{
        var headers = HTTPHeaders()
        headers["Accept"] = "application/json"
        headers["Authorization"] = "Bearer " + (UserDefaults.standard.loadToken() ?? "")
        headers["lang"] = "en"
        return headers
    }
    
    var urlRequest: URLRequest {
        var request = URLRequest(url: requestURL)
        request.httpMethod = method.rawValue
        headers.forEach { header in
            request.addValue(header.value, forHTTPHeaderField: header.name)
        }
        return request
    }
    
    func asURLRequest() throws -> URLRequest {
        return try encoding.encode(urlRequest, with: parameters)
    }
}
