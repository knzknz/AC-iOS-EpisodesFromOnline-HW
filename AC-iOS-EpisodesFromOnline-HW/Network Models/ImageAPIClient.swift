//
//  ImageAPIClient.swift
//  AC-iOS-EpisodesFromOnline-HW
//
//  Created by C4Q on 12/4/17.
//  Copyright © 2017 C4Q . All rights reserved.
//
import UIKit

class ImageAPIClient {
    private init() {}
    static let manager = ImageAPIClient()
    func getImage(from urlStr: String, //got it from VC
                  completionHandler: @escaping (UIImage) -> Void,
                  errorHandler: @escaping (Error) -> Void) {
        guard let url = URL(string: urlStr) else { return }
        let completion: (Data) -> Void = {(data: Data) in //waits for resonse from network helper to see if it can complete the comletion
            guard let onlineImage = UIImage(data: data) else { return }
            completionHandler(onlineImage) //send to VC
        }
        NetworkHelper.manager.performDataTask(with: url,
                                              completionHandler: completion,
                                              errorHandler: errorHandler)
    }
}
