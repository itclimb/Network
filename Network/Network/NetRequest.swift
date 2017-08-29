//
//  NetRequest.swift
//  Network
//
//  Created by itclimb on 2017/8/29.
//  Copyright © 2017年 itclimb.yuancheng.com. All rights reserved.
//

import UIKit
import Alamofire

class NetRequest: NSObject {
    
    //MARK: - 普通的GET请求
    func get(url: String, succeeded: @escaping (_ responseObject: Any?)->(), failed: @escaping (_ error: Error?)->()) {
        Alamofire.request(url).responseJSON { (response) in
            switch response.result{
            case .success(let success):
                succeeded(success as Any)
            case .failure(let error):
                failed(error)
            }
        }
    }
    
    

}
