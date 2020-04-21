//
//  Router.swift
//  SparkNetworks
//
//  Created by Janbaz Ali on 20/04/2020.
//  Copyright © 2020 Janbaz Ali. All rights reserved.
//

import Foundation

struct ProductionServer {
    static var host = "api.deezer.com"
}
public protocol URLRequestConvertible {
    func urlRequest()  -> URLRequest?
}
enum Router<T>: URLRequestConvertible {
    
    case getTest(T)
    
   private var scheme: String {
        switch self {
        case .getTest:
            return "https"
        }
    }
   private var host: String {
        switch self {
        case .getTest:
            return ProductionServer.host
        }
    }
    private var path: String {
        switch self {
        case .getTest(_):
            return  "test json path"
        }
    }
   private var method: String {
        switch self {
        case .getTest:
            return "GET"
        }
    }
   
    private var queryParameters: [URLQueryItem]? {
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
        urlRequest.httpMethod = self.method
        
        return urlRequest
    }
}
