//
//  RememberItItem.swift
//  RememberIt
//
//  Created by Stewart Lynch on 2020-09-13.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//

import Foundation

struct RememberItItem: Codable {
    var id = UUID()
    var title: String
    var icon: String
    var detail1: String
    var detail2: String
    var isPrimary = false

    static let sample = RememberItItem(title: "Sample", icon: "other", detail1: "Information", detail2: "More Information")
}
