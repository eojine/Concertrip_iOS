//
//  DetailThemeService.swift
//  Concertrip
//
//  Created by 양어진 on 05/01/2019.
//  Copyright © 2019 양어진. All rights reserved.
//

import Foundation
import Alamofire

struct DetailThemeService: APIManager, Requestable{
    typealias NetworkData = ResponseObject<DetailTheme>
    static let shared = DetailThemeService()
    var detailURL = url("/api/genre/detail")
    let header: HTTPHeaders = [
        "Content-Type" : "application/json",
        "Authorization" : "1"
    ]
    
    
    func getThemeDetailList(id: String, completion: @escaping (DetailTheme) -> Void) {
        let artistDetail = detailURL + "?id=\(id)"
        gettable(artistDetail, body: nil, header: header) { (res) in
            switch res {
            case .success(let value):
                guard let detailList = value.data else
                {return}
                completion(detailList)
            case .error(let error):
                print(error)
            }
        }
    }
    
    
}