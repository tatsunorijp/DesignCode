//
//  HomeView.swift
//  DesignCode
//
//  Created by Wellington Tatsunori Asahide on 30/03/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            FeaturedItem()
            
            Color.clear.frame(height: 1000)
        }
        .safeAreaInset(edge: .top, content: {
            Color.clear.frame(height: 70)
        })
        .overlay(NavigationBar(title: "Feature"))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
