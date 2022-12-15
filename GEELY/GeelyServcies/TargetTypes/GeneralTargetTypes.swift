//
//  TargetTypes.swift
//  GEELY
//
//  Created by Tuqa on 12/12/22.
//

import Foundation
import Alamofire

//MARK: -
enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}
//MARK: -requests, parameters forms enum
enum Task {
    case requestPlain // case there is no parameters to request, or normal request
    case requestParameters(parameters: [String: Any], encoding: ParameterEncoding)
}
//MARK: -all the properties of the request
protocol TargetType {
    var domian: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var task: Task { get }
    var headers: [String: String]? { get }
}
