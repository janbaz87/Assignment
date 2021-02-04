//
//  Router.swift
//  SparkNetworks
//
//  Created by Janbaz Ali on 20/04/2020.
//  Copyright © 2020 Janbaz Ali. All rights reserved.
//

import Foundation

struct ProductionServer {
    static var host = "c312fba5-2273-499b-ab67-45f000758df5.mock.pstmn.io"
}
public protocol URLRequestConvertible {
    func urlRequest()  -> URLRequest?
}

enum Router <T>: URLRequestConvertible where T: Codable{
    
    case getTest(T)
    
   private var scheme: String {
        switch self {
        default:
            return "https"
        }
    }
   private var host: String {
        switch self {
        default:
            return ProductionServer.host
        }
    }
    private var path: String {
        switch self {
        case .getTest:
            return  "/personality-test/"
        
        }
    }
   private var method: MTHTTPMethod {
        switch self {
        case .getTest:
            return .get
        
        }
    }
   
    private var queryParameters: [URLQueryItem]? {
        switch self {
    
        default:
            return nil
        }
    }
    
    private var input : T? {
        switch self {
        
        default:
            return nil
        }
    }
    
    func urlRequest() -> URLRequest? {
        
        var components = URLComponents()
        components.queryItems = queryParameters
        
        components.scheme = self.scheme
        components.host = self.host
        components.path = self.path
        
        guard let url = components.url else {
            assert(true,"url not formed")
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = self.method.rawValue
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        if let parameters = input {
            urlRequest.httpBody = Data()
            do {
                let encoder = JSONEncoder()
                encoder.dateEncodingStrategy = .millisecondsSince1970
                urlRequest.httpBody = try encoder.encode(parameters)
            } catch {
                return nil
            }
        }
        
        return urlRequest
    }
}


