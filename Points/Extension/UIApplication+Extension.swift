//
//  UIApplication+Extension.swift
//  Points
//
//  Created by xingle on 2025/4/22.
//

import UIKit

extension UIApplication {
    var keyWindow: UIWindow? {
        return (connectedScenes.first as? UIWindowScene)?.windows.first(where: \.isKeyWindow)
    }
}
