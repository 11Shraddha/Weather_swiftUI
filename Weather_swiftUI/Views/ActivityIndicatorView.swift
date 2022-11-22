//
//  ActivityIndicatorView.swift
//  Weather_swiftUI
//
//  Created by Shraddha on 21/11/22.
//

import SwiftUI


struct ActivityIndicatorView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ActivityIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicatorView()
    }
}
