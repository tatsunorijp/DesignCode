//
//  AccountView.swift
//  DesignCode
//
//  Created by Wellington Tatsunori Asahide on 29/03/22.
//

import SwiftUI

struct AccountView: View {
    @State var isDeleted = false
    @State var isPinned = false
    
    var body: some View {
        NavigationView {
            List {
                profile
                menu
                links
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Account")
        }
    }
    
    var profile: some View {
        VStack(spacing: 8) {
            Image(systemName: "person.crop.circle.fill.badge.checkmark")
                .symbolVariant(.circle.fill)
                .font(.system(size: 32))
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue, .blue.opacity(0.3))
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
                .background(
                    HexagonView()
                        .offset(x: -50, y: -100)
                )
                .background(
                    BlobView()
                        .offset(x: 200, y: 0)
                        .scaleEffect(0.6)
                )
            Text("Wellington Asahide")
                .font(.title.weight(.semibold))
            HStack {
                Image(systemName: "location")
                    .imageScale(.small)
                Text("Paraguay")
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
    
    var menu: some View {
        Section {
            NavigationLink(destination: HomeView()) {
                Label("Settings", systemImage: "gear")
            }
            
            NavigationLink { HomeView() } label: {
                Label("Billing", systemImage: "creditcard")
            }
            
            NavigationLink { HomeView() } label: {
                Label("Help", systemImage: "questionmark")
            }
        }
        .accentColor(.primary)
        .listRowSeparatorTint(.blue)
        .listRowSeparator(.hidden)
    }
    
    var links: some View {
        Section {
            if !isDeleted {
                Link(destination: URL(string: "http://www.linkedin.com/in/tatsunori")!) {
                    HStack {
                        Label("Linkedin", systemImage: "house")
                        Spacer()
                        Image(systemName: "link")
                            .foregroundColor(.secondary)
                    }
                }
                .swipeActions(edge: .leading, allowsFullSwipe: false) {
                    Button(action: { isDeleted = true }) {
                        Label("Delete", systemImage: "trash")
                            .foregroundColor(.red)
                    }
                    .tint(.red)
                    pinButton
                }
            }
            Link(destination: URL(string: "http://www.youtube.com")!) {
                HStack {
                    Label("Linkedin", systemImage: "tv")
                    Spacer()
                    Image(systemName: "link")
                        .foregroundColor(.secondary)
                }
            }
            .swipeActions {
                pinButton
            }
        }
        .listRowSeparator(.hidden)
        .accentColor(.primary)
    }
    
    var pinButton: some View {
        Button(action: {
            isPinned.toggle()
        }, label: {
            isPinned
                ? Label("Unpin", systemImage: "pin.slash")
                : Label("Pin", systemImage: "pin")
        })
            .tint(isPinned ? .gray : .yellow)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
