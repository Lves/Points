//
//  Color+Extension.swift
//  Points
//
//  Created by xingle on 2025/4/10.
//

import Foundation
import SwiftUICore

enum XLColor: String {
    case red
    case blue
    case dark
    case redDark
    case blueDark
}

extension Color {
    static let redXL = Color(XLColor.red.rawValue)
    static let blueXL = Color(XLColor.blue.rawValue)
    static let darkXL = Color(XLColor.dark.rawValue)
    static let redDarkXL = Color(XLColor.redDark.rawValue)
    static let blueDarkXL = Color(XLColor.blueDark.rawValue)
}
