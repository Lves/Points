//
//  UIScreen+Extension.swift
//  Points
//
//  Created by xingle on 2025/4/10.
//

import UIKit

extension UIScreen {
    static var isPortrait: Bool {
        return main.bounds.height > main.bounds.width
    }
}
