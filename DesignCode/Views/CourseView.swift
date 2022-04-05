//
//  CourseView.swift
//  DesignCode
//
//  Created by Wellington Tatsunori Asahide on 04/04/22.
//

import SwiftUI

struct CourseView: View {
    var namespace: Namespace.ID
    @Binding var show: Bool
    @State var appear = [false, false, false]
    
    var body: some View {
        
        ZStack {
            ScrollView {
                cover
                content
                    .offset(y: 120)
                    .padding(.bottom, 200)
                    .opacity(appear[2] ? 1 : 0)
            }
            .background(Color("Background"))
            .ignoresSafeArea()
            button
        }
        .onAppear {
            fadeIn()
        }
        .onChange(of: show) { _ in
            fadeOut()
        }
        
    }
    
    var cover: some View {
//        VStack {
//            Spacer()
//        }
//        .frame(maxWidth: .infinity)
//        .frame(height: 500)
//        .foregroundColor(.black)
//        .background(
//            Image("Illustration 9")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .matchedGeometryEffect(id: "image", in: namespace)
        //        )
        
        Image("Illustration 9")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .matchedGeometryEffect(id: "image", in: namespace)
            .frame(maxWidth: .infinity)
            .frame(height: 500)
            .foregroundColor(.black)
            .background(
                Image("Background 5")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "background", in: namespace)
        )
        .mask(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .matchedGeometryEffect(id: "mask", in: namespace)
        )
        
        .overlay(
            VStack(alignment: .leading, spacing: 12) {
                Text("SwiftUI")
                    .font(.largeTitle.weight(.bold))
                    .matchedGeometryEffect(id: "title", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("20 sections - 3 hours".uppercased())
                    .font(.footnote.weight(.semibold))
                    .matchedGeometryEffect(id: "subtitle", in: namespace)
                Text("Build an iOS app fpr iOS 15 with custom layourts, animations and...")
                    .font(.footnote)
                    .matchedGeometryEffect(id: "text", in: namespace)
                Divider()
                    .opacity(appear[0] ? 1 : 0)
                HStack {
                    Image("Avatar Default")
                        .resizable()
                        .frame(width: 26, height: 26)
                        .cornerRadius(10)
                        .padding(8)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
                        .strokeStyle(cornerRadius: 18)
                    Text("Taught by Tatsu Asahide")
                        .font(.footnote)
                }
                .opacity(appear[1] ? 1 : 0)
            }
                .padding(20)
                .background(
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                        .matchedGeometryEffect(id: "blur", in: namespace)
                )
                .offset(y: 250)
                .padding(20)
        )
    }
    
    var content: some View {
        VStack {
            Text("Teste de apresentação")
                .font(.largeTitle.weight(.bold))
            Text("Cade o figma meu fi")
                .font(.title.weight(.semibold))
            Text("Aqui deveria ter uns lorem ipsum Aqui deveria ter uns lorem ipsum Aqui deveria ter uns lorem ipsum Aqui deveria ter uns lorem ipsum Aqui deveria ter uns lorem ipsum Aqui deveria ter uns lorem ipsum Aqui deveria ter uns lorem ipsum Aqui deveria ter uns lorem ipsum")
                .font(.body)
        }
    }
    
    var button: some View {
        Button {
            withAnimation(.closeCard) {
                show.toggle()
            }
        } label: {
            Image(systemName: "xmark")
                .font(.body.weight(.bold))
                .foregroundColor(.secondary)
                .padding(8)
                .background(.ultraThinMaterial, in: Circle())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        .padding(20)
        .ignoresSafeArea()
    }
    
    func fadeIn() {
        withAnimation(.easeOut.delay(0.3)) {
            appear[0] = true
        }
        withAnimation(.easeOut.delay(0.4)) {
            appear[1] = true
        }
        withAnimation(.easeOut.delay(0.5)) {
            appear[2] = true
        }
    }
    
    func fadeOut() {
        appear[0] = false
        appear[1] = false
        appear[2] = false
    }
}

struct CourseView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        CourseView(namespace: namespace, show: .constant(true))
    }
}
