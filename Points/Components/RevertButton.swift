//
//  RevertButton.swift
//  Points
//
//  Created by xingle on 2025/4/22.
//

import SwiftUI

struct RevertButton: View {
    let action: @MainActor () -> Void
    let safeAreaInsets = UIApplication.shared.keyWindow?.safeAreaInsets ?? UIEdgeInsets()
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    action()
                }) {
                    Image(systemName: "arrow.uturn.left.circle")
                        .font(.system(size: 34))
                        .foregroundColor(Color.gray.opacity(0.9))
                }
                .padding(EdgeInsets(top: max(safeAreaInsets.top, 10), leading: 0, bottom: 0, trailing: max(safeAreaInsets.right, 10)))
            }
            Spacer()
        }
    }
}

#Preview {
    RevertButton(action: {
        
    })
}
