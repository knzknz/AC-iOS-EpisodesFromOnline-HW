//
//  NetworkHelper.swift
//  AC-iOS-EpisodesFromOnline-HW
//
//  Created by C4Q on 12/4/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

class NetworkHelper {
    private init() {}
    static let manager = NetworkHelper()
    let urlSession = URLSession(configuration: URLSessionConfiguration.default)
    func performDataTask(with url: URL, completionHandler: @escaping ((Data) -> Void), errorHandler: @escaping ((Error) -> Void)) {
        self.urlSession.dataTask(with: url){(data: Data?, response: URLResponse?, error: Error?) in //fancy phone call to get data
            DispatchQueue.main.async {
                guard let data = data else { //can i make the data? If so continue
                    return
                }
                if let error = error {
                    errorHandler(error)
                }
                completionHandler(data) //pushes to API
            }
            }.resume()
    }
}
