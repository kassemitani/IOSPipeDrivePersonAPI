//
//  PipeDriveApi.swift
//
//  Copyright © 2019 kassem Itani. All rights reserved.
//

import Moya

enum PipeDriveApi {
    case getPersons
}

extension PipeDriveApi: TargetType {
    
    var baseURL: URL {
        let urlString = Constants.SERVER_URL
        guard let url = URL(string: urlString) else {
            fatalError("base URL could not be configured")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .getPersons:
            return "\(Constants.API_VERSION)\(Constants.PERSONS_API)"
        }
    }
    
    var method: Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return Task.requestParameters(
            parameters: ["api_token" : Constants.API_KEY],
            encoding: URLEncoding.default
        )
    }
    
    var headers: [String : String]? {
        return nil
    }
    
}
