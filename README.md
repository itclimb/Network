# Network
网络请求封装

基于Alamofire的数据请求,json返回格式
```
  //MARK: - 普通的post请求
    func post(url: String, params: NSDictionary, succeeded: @escaping (_ reponseObject: Any?)->(), failed: @escaping (_ error: Error?)->()) {
        Alamofire.request(url, method: .post, parameters: params as? Parameters, encoding:JSONEncoding.default).validate().responseJSON { (response) in
            switch response.result {
            case .success(let success):
                succeeded(success)
            case .failure(let error):
                failed(error)
            }
        }
    }
```
以表单的格式上传图片
```
    //MARK: - 上传图片
    func upload(url: String, imageArray: [UIImage], progress: @escaping (Progress)->(), succeeded: @escaping (_ responseObject: Any?)->(), failed: @escaping (_ error: Error?)->()) {
        
        Alamofire.upload(multipartFormData: { (formData) in
            let count = String(format: "%d", arguments: [imageArray.count]).data(using: .utf8)
            formData.append(count!, withName: "f_count")
            
            for i in 0..<imageArray.count {
                let name = String(format: "pic_%d", arguments: [i])
                let fileName = name + ".jpg"
                let image = imageArray[i]
                
                if var data: NSData = UIImagePNGRepresentation(image) as NSData? {
                    if CGFloat(data.length)/(1000 * 1000.0) > 1{
                        data = (UIImageJPEGRepresentation(image, (1000 * 1000.0)/CGFloat(data.length)) as NSData?)!
                    }
                    formData.append(data as Data, withName: name, fileName: fileName, mimeType: "image/jpg")
                }
            }
            
        }, to: url) { (result) in
            switch result {
            case .success(request: let load, _, _) : do {
                load.uploadProgress(closure: progress)
                load.responseJSON(completionHandler: { (response) in
                    succeeded(response.value as AnyObject)
                })
                }
            case .failure(let error) : do {
                failed(error)
                }
            }
        }
    }
```
