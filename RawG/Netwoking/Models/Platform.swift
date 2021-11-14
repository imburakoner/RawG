//
//  Platform.swift
//  RawG
//
//  Created by Burak Oner on 14.11.2021.
//

import Foundation

struct Platform: Decodable {
    let platform: ParentPlatform?
    let releasedAt: String?
    let requirementsEn: Requirement?
    let requirementsRu: Requirement?
}
