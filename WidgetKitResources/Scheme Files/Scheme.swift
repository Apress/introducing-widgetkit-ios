//
//  Scheme.swift
//  I Remember
//
//  Created by Stewart Lynch on 2020-09-30.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//

import UIKit

@available(iOS 13,*)
enum Scheme {
    case `default`
    case forest
    case sky
    case purple
    case sunny

    var fgColor: UIColor {
        switch self {
        case .`default`:
            return UIColor.label
        case .forest:
            return UIColor(named: "forestFG")!
        case .sky:
            return UIColor(named: "skyFG")!
        case .purple:
            return UIColor(named: "purpleFG")!
        case .sunny:
            return UIColor(named: "sunnyFG")!
        }
    }
    var bgColor: UIColor {
        switch self {
        case .`default`:
            return UIColor.systemBackground
        case .forest:
            return UIColor(named: "forestBG")!
        case .sky:
            return UIColor(named: "skyBG")!
        case .purple:
            return UIColor(named: "purpleBG")!
        case .sunny:
            return UIColor(named: "sunnyBG")!
        }
    }
}


