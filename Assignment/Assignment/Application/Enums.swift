//
//  Enums.swift
//  SparkNetworks
//
//  Created by Janbaz Ali on 24/04/2020.
//  Copyright © 2020 Janbaz Ali. All rights reserved.
//

import Foundation


enum TestStatus {
    case start
    case end
    case next
}

enum MTHTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

enum ContentType: String {
    case json = "application/json"
    case xwwwFormURLEncoded = "application/x-www-form-urlencoded"
    case multiPartFormData = "multipart/form-data"
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case userAgent = "User-Agent"
    case acceptLanguage = "Accept-Language"
    case appVersion = "App-Version"
}
