//
//  RequestManager.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 08/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import Foundation
import Alamofire

class RequestManager {
    private let sessionManager = Session()
    
    func makeRequest<T>(router: ApiRouter, resultType: T.Type, success: @escaping (T) -> Void, fail: @escaping (AFError) -> Void) where T: Codable {
        // TODO add interceptor
        sessionManager.request(router, interceptor: nil).validate().response { (response) in
            switch response.result {
            case .success(let reponseData):
                guard let data = reponseData else {
                    return
                }
                
                do {
                    let data = try JSONDecoder().decode(resultType, from: data)
                    success(data)
                } catch let error {
                    print("===Parse error===", error)
                    
                }
            case .failure(let error):
                fail(error)
            }
        }
    }
}
