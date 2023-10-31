//
//  CreditsView.swift
//  Africa
//
//  Created by Nonato Sousa on 31/10/23.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70, height: 70, alignment: .center)
            
            Text("""
            Copyright @ Nonato Sousa
            All right reserved
            SwiftUI is so funny
            """)
            .multilineTextAlignment(.center)
            .font(.footnote)
        }
        .foregroundColor(.secondary)
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
