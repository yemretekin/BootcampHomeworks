//
//  Client.swift
//  RandomQuoteApp
//
//  Created by Emre Tekin on 19.11.2022.
//

import Foundation

class Client {
    
    enum Endpoints {
           static let base = "https://programming-quotes-api.herokuapp.com"
           
           case spells
           
           var stringValue: String {
               switch self {
               case .spells:
                   return Endpoints.base + "/Quotes/random"
               }
           }
           
           var url: URL {
               return URL(string: stringValue)!
           }
       }
    @discardableResult
    class func taskForGETRequest<ResponseType: Decodable>(url: URL, responsetType: ResponseType.Type, completion: @escaping (ResponseType?, Error?) -> Void) -> URLSessionDataTask {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            let decoder = JSONDecoder()
            do {
                let responseObject = try decoder.decode(ResponseType.self, from: data)
                DispatchQueue.main.async {
                    completion(responseObject, nil)
                }
            } catch {
                do {
                    let errorResponse = try decoder.decode(BaseResponse.self, from: data) as Error
                    DispatchQueue.main.async {
                        completion(nil, errorResponse)
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(nil, error)
                    }
                }
            }
        }
        task.resume()
        return task
    }
    
    class func getSpells(completion: @escaping (RandomModel?, Error?) -> Void) {
        taskForGETRequest(url: Endpoints.spells.url, responsetType: RandomModel.self) { response, error in
            if let response = response {
                completion(response, nil)
            } else {
                completion(nil, error)
            }
        }
    }
}
