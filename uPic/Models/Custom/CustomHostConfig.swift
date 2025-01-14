//
//  CustomHostConfig.swift
//  uPic
//
//  Created by Svend Jin on 2019/6/27.
//  Copyright © 2019 Svend Jin. All rights reserved.
//

import Foundation
import SwiftyJSON

@objcMembers
class CustomHostConfig: HostConfig {
    dynamic var url: String!
    dynamic var method: String! = RequestMethods.POST.rawValue
    dynamic var field: String!
    dynamic var bodys: String?
    dynamic var headers: String?
    dynamic var resultPath: String?
    dynamic var domain: String?
    dynamic var saveKey: String? = HostSaveKey.filename.rawValue
    dynamic var suffix: String?

    override func displayName(key: String) -> String {
        switch key {
        case "url":
            return NSLocalizedString("host.field.url", comment: "url")
        case "method":
            return NSLocalizedString("host.field.method", comment: "method")
        case "field":
            return NSLocalizedString("host.field.field", comment: "field")
        case "bodys":
            return NSLocalizedString("host.field.bodys", comment: "bodys")
        case "headers":
            return NSLocalizedString("host.field.headers", comment: "headers")
        case "resultPath":
            return NSLocalizedString("host.field.resultPath", comment: "resultPath")
        case "domain":
            return NSLocalizedString("host.field.domain", comment: "domain")
        case "saveKey":
            return NSLocalizedString("host.field.saveKey", comment: "fileName")
        case "suffix":
            return NSLocalizedString("host.field.suffix", comment: "suffix")
        default:
            return ""
        }
    }

    override func serialize() -> String {
        var dict = Dictionary<String, Any>()
        dict["url"] = self.url
        dict["method"] = self.method
        dict["field"] = self.field
        dict["bodys"] = self.bodys
        dict["headers"] = self.headers
        dict["resultPath"] = self.resultPath
        dict["domain"] = self.domain
        dict["saveKey"] = self.saveKey
        dict["suffix"] = self.suffix

        return JSON(dict).rawString()!
    }

    static func deserialize(str: String?) -> CustomHostConfig? {
        let config = CustomHostConfig()
        guard let str = str else {
            return config
        }
        let data = str.data(using: String.Encoding.utf8)
        let json = try! JSON(data: data!)
        config.url = json["url"].stringValue
        config.method = json["method"].stringValue
        config.field = json["field"].stringValue
        config.bodys = json["bodys"].stringValue
        config.headers = json["headers"].stringValue
        config.resultPath = json["resultPath"].stringValue
        config.domain = json["domain"].stringValue
        config.saveKey = json["saveKey"].stringValue
        config.suffix = json["suffix"].stringValue
        return config
    }
}
