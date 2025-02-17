//
//  UpYunUploader.swift
//  uPic
//
//  Created by Svend Jin on 2019/6/10.
//  Copyright © 2019 Svend Jin. All rights reserved.
//

import Cocoa
import SwiftyJSON
import Alamofire

class UpYunUploader: BaseUploader {

    static let shared = UpYunUploader()

    let url = "https://v0.api.upyun.com/"

    static let fileExtensions: [String] = []

    func _upload(_ fileUrl: URL?, fileData: Data?) {
        guard let host = ConfigManager.shared.getDefaultHost(), let data = host.data else {
            super.faild(errorMsg: NSLocalizedString("bad-host-config", comment: "bad host config"))
            return
        }

        super.start()

        let config = data as! UpYunHostConfig


        let bucket = config.bucket!
        let operatorName = config.operatorName!
        let password = config.password!
        let hostSaveKey = HostSaveKey(rawValue: config.saveKey!)!
        let domain = config.domain!

        var fileName = ""
        var mimeType = ""
        if let fileUrl = fileUrl {
            fileName = "\(hostSaveKey.getFileName(filename: fileUrl.lastPathComponent.deletingPathExtension)).\(fileUrl.pathExtension)"
            mimeType = Util.getMimeType(pathExtension: fileUrl.pathExtension)
        } else if let fileData = fileData {
            // MARK: 处理截图之类的图片，生成一个文件名
            let fileType = fileData.contentType() ?? "png"
            fileName = "\(hostSaveKey.getFileName()).\(fileType)"
            mimeType = Util.getMimeType(pathExtension: fileType)
        } else {
            super.faild(errorMsg: "Invalid file")
            return
        }

        var saveKey = fileName
        if (config.folder != nil && config.folder!.count > 0) {
            saveKey = "\(config.folder!)\(saveKey)"
        }

        // MARK: 加密 policy
        var policyDict = Dictionary<String, Any>()
        policyDict["bucket"] = bucket
        policyDict["save-key"] = saveKey

        let policy = UpYunUtil.getPolicy(policyDict: policyDict)

        // MARK: 加密 signature
        let signatureParams = ["POST", "/\(bucket)", policy]
        let signatureStr = signatureParams.joined(separator: "&")
        let hmac = signatureStr.calculateHMACByKey(key: password.toMd5())
        let signature = hmac.toBase64()!

        // MARK: 生成 authorization
        let authorization = "UPYUN \(operatorName):\(signature)"

        var headers = HTTPHeaders()
        headers.add(HTTPHeader.authorization(authorization))
        headers.add(HTTPHeader.contentType("application/x-www-form-urlencoded;charset=utf-8"))
        
        
        func multipartFormDataGen(multipartFormData: MultipartFormData) {
            if fileUrl != nil {
                multipartFormData.append(fileUrl!, withName: "file", fileName: fileName, mimeType: mimeType)
            } else {
                multipartFormData.append(fileData!, withName: "file", fileName: fileName, mimeType: mimeType)
            }
            multipartFormData.append(authorization.data(using: .utf8)!, withName: "authorization")
            multipartFormData.append(policy.data(using: .utf8)!, withName: "policy")
        }

        AF.upload(multipartFormData: multipartFormDataGen, to: "\(url)\(bucket)", headers: headers).validate().uploadProgress { progress in
            super.progress(percent: progress.fractionCompleted)
        }.responseJSON(completionHandler: { response -> Void in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let code = json["code"]
                if 200 == code {
                    super.completed(url: "\(domain)/\(saveKey)\(config.suffix ?? "")")
                } else {
                    super.faild(errorMsg: json["message"].string)
                }
            case .failure(let error):
                super.faild(errorMsg: error.localizedDescription)
            }
        })

    }

    func upload(_ fileUrl: URL) {
        self._upload(fileUrl, fileData: nil)
    }

    func upload(_ fileData: Data) {
        self._upload(nil, fileData: fileData)
    }
}
