//
//  openAPI.swift
//  goodStore
//
//  Created by mac on 2021/08/05.
//

import UIKit
import Alamofire
import RxSwift

class openAPI {
    let baseURL = "http://openapi.seoul.go.kr:8088/6d66495650696d683130357168494350/json/ListPriceModelStoreService/1/2/"
    
    func response(endString: String, completion: @escaping (Result<store, GPError>) -> Void) {
        AF.request(baseURL + endString, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result {
                case .success(_):
                    guard let data = response.data else { return }
                    do {
//                        guard let store = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {return}
//                        guard let ListPriceModelStoreService = store["ListPriceModelStoreService"] as? [String: Any] else {return}
//                        guard let row = ListPriceModelStoreService["row"] as? [String: Any] else {return}
////                        let storeName = String(data: row["SH_NAME"] as! Data, encoding: .utf8)
//                        print("response Results:  \(String(describing: ListPriceModelStoreService))")
                        guard let store = try? JSONDecoder().decode(store.self, from: data) else {return}
                        print("store \(store)")
                    } catch {
                        print(response.error)
                    }
                case .failure(_):
                    print(response.error!)
                }
        }
    }
    
}
