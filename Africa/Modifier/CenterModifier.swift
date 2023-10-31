//
//  CenterModifier.swift
//  Africa
//
//  Created by Nonato Sousa on 31/10/23.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
