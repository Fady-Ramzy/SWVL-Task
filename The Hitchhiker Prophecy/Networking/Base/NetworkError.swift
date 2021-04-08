//
//  NetworkError.swift
//  SwvlNetworking
//
//  Created by Mohamed Matloub on 6/10/20.
//  Copyright © 2018 Swvl Inc. All rights reserved.
//

import Alamofire

public enum NetworkError: Error {
    case
    server,
    cannotParseResponse,
    unknown
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .server:
            return "Server Error"
        case .cannotParseResponse:
            return "Cannot parse response"
        case .unknown:
            return "Unknown"
        }
    }
}
