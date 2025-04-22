//
//  View+Extension.swift
//  Points
//
//  Created by xingle on 2025/4/22.
//

import SwiftUI
import UIKit

let generator: UIImpactFeedbackGenerator = {
    let generator = UIImpactFeedbackGenerator(style: .medium)
    generator.prepare()
    return generator
}()

extension View {
    func shake() {
        generator.impactOccurred()
    }
}

