//
//  StationRepository.swift
//  hire-ios-test
//
//  Created by Aleksandr Myaots on 28.08.16.
//  Copyright © 2016 amyaots. All rights reserved.
//

import Foundation
import PromiseKit
import ObjectMapper

class StationRepository: StationRepositoryType {
    func getStations() -> Promise<ArraysCities> {
        return Promise { fulfil, reject in
            let error = NSError(domain: "The file operation failed because the file does not exist."
                , code: NSURLErrorFileDoesNotExist, userInfo: nil)
            if let path = NSBundle.mainBundle().pathForResource("allStations", ofType: "json") {
                guard let jsonData = NSData(contentsOfFile: path) else {
                    throw error
                }
                let json = try NSJSONSerialization.JSONObjectWithData(jsonData, options: .MutableContainers)
                guard let arrays = Mapper<ArraysCities>().map(json) else {
                    throw NSError(domain: "Cant mapped json"
                        , code: NSURLErrorUnknown, userInfo: nil)
                }
                fulfil(arrays)
            } else {
                reject(error)
            }
        }
    }
}
