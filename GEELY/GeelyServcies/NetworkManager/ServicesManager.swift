//
//  servicesManager.swift
//  GEELY
//
//  Created by Tuqa on 12/12/22.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

//MARK: -Generic request function
//make it generics which confirm to the tergetType protocol in case of inheritance
class ServicesManager<T: TargetType>  {
    func fetchingData<M: Decodable>(target: T, response: M.Type, completion: @escaping (Result<M?>) -> Void) {
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let parameters = buildParameters(task: target.task)
        Alamofire.request(target.domian + target.path, method: method!,
                          // .0  realting to parameters and the .1 for the ecndoding
                          parameters: parameters.0, encoding: parameters.1).responseJSON { (response) in
            // decode the result and send it back to the user
            let decoder = JSONDecoder()
            guard let data = response.data else { return }
            do {
                let decodingData = try decoder.decode(M.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decodingData))
                }
                print(decodingData)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    //MARK: -create the parameters method
    private func buildParameters(task: Task) -> ([String: Any], ParameterEncoding){
        switch task {
        case .requestPlain:
            return ([:], URLEncoding.default) // no parameters, URLEncoding(Json, query..)
        case .requestParameters(parameters: let parameters, encoding: let encoding):
            return (parameters, encoding) // giv it parameter ,encoding such as JSON
        }
    }
}
