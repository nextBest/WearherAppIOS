//
//  RequestManager.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 08/01/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import Foundation
import Alamofire

struct RequestManager {
    private let sessionManager = Session()
    
    func makeRequest<T>(router: ApiRouter, resultType: T.Type, success: @escaping (T) -> Void, fail: @escaping (NetworkError) -> Void) where T: Codable {
        sessionManager.request(router, interceptor: nil).validate().response { (response) in
            switch response.result {
            case .success(let reponseData):
                guard let data = reponseData else {
                    return
                }
                
                do {
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .custom({ (decoder) -> Date in
                        guard let container = try? decoder.singleValueContainer(),
                            let text = try? container.decode(String.self) else {
                                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Could not decode date text"))}
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSX"
                        if let date = dateFormatter.date(from: text) {
                            return date
                        }
                        dateFormatter.dateFormat = "yyyy-MM-dd"
                        if let date = dateFormatter.date(from: text) {
                            return date
                        }
                        return Date()
                    })
                    let data = try jsonDecoder.decode(resultType, from: data)
                    success(data)
                } catch let error {
                    print("ParseError: \(error.localizedDescription)")
                    fail(.parseError)
                }
            case .failure(let error):
                if error.isSessionTaskError {
                    fail(.connectionError)
                } else {
                    fail(.defaultError)
                }
            }
        }
    }
}
