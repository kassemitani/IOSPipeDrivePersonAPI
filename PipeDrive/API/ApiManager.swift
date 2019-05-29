//
//  ApiManager.swift
//
//  Copyright © 2019 kassem Itani. All rights reserved.
//

import Moya

struct ApiManager {
    static let pipeDriveProvider =
        MoyaProvider<PipeDriveApi>(plugins: [NetworkLoggerPlugin(verbose: true)])
    
    static let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    static func getPersons(
        success: @escaping ([Person]) -> (),
        failure: @escaping (String) -> ()
        ) {
        
        pipeDriveProvider.request(.getPersons) { result in
            switch result {
            case .success(let response):
                guard response.statusCode == Constants.HTTP_OK else {
                    failure("Error \(response.statusCode)")
                    return
                }
                
                do {
                    let response = try jsonDecoder.decode(Persons.self, from: response.data)
                    success(response.data)
                } catch {
                    print("JSON decode error: \(error)")
                    failure(error.localizedDescription)
                }
                
            case .failure(let error):
                failure(error.localizedDescription)
            }
        }
    }
}
