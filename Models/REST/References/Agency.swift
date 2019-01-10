//
//  Agency.swift
//  OBAKit
//
//  Created by Aaron Brethorst on 10/20/18.
//  Copyright © 2018 OneBusAway. All rights reserved.
//

import Foundation

public class Agency: NSObject, Decodable {
    public let disclaimer: String?
    public let email: String?
    public let fareURL: URL?
    public let id: String
    public let language: String
    public let name: String
    public let phone: String
    public let isPrivateService: Bool
    public let timeZone: String
    public let agencyURL: URL

    private enum CodingKeys: String, CodingKey {
        case disclaimer
        case email
        case fareURL = "fareUrl"
        case id
        case language = "lang"
        case name
        case phone
        case isPrivateService = "privateService"
        case timeZone = "timezone"
        case agencyURL = "url"
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        disclaimer = ModelHelpers.nilifyBlankValue(try container.decode(String.self, forKey: .disclaimer))
        email = ModelHelpers.nilifyBlankValue(try? container.decode(String.self, forKey: .email))
        fareURL = try? container.decode(URL.self, forKey: .fareURL)

        id = try container.decode(String.self, forKey: .id)
        language = try container.decode(String.self, forKey: .language)
        name = try container.decode(String.self, forKey: .name)
        phone = try container.decode(String.self, forKey: .phone)
        isPrivateService = try container.decode(Bool.self, forKey: .isPrivateService)
        timeZone = try container.decode(String.self, forKey: .timeZone)
        agencyURL = try container.decode(URL.self, forKey: .agencyURL)
    }
}