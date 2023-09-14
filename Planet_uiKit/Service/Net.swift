//  Net.swift
//  Planet_uiKit
//  Created by Naleesh Jeffrey on 2023-09-14.

import Foundation
import RxSwift

actor Net{
    
    public static let shared = Net()
    private init(){}
    
    enum NetworkError: Error {
        case invalidURL
        case requestFailed
        case invalidData
    }
    
    func fetchData<T: Decodable>(endPoint: EndPoint) -> Observable<T> {
        return Observable.create { observer in
            let task = URLSession.shared.dataTask(with: URL(string: endPoint.rawValue)!) { data, _, error in
                if let error = error {
                    observer.onError(error)
                    return
                }
                
                guard let data = data,
                      let decodedData = try? JSONDecoder().decode(T.self, from: data)
                else {
                    observer.onError(NSError(domain: "Error parsing data", code: 0, userInfo: nil))
                    return
                }
                observer.onNext(decodedData)
                observer.onCompleted()
            }
            task.resume()
            return Disposables.create {
                task.cancel()
            }
        }
    }
}
