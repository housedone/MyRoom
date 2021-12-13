//
//  ImageGallery.swift
//  MyRoom
//
//  Created by 김우성 on 2021/12/13.
//

import SwiftUI

struct ImageGallery: View {
    private var numberOfImages = 14
    
    var body: some View {
        GeometryReader { proxy in
            
            TabView {
                ForEach(0..<numberOfImages) { num in
                    Image("\(num)")
                        .resizable()
                        .scaledToFill()
                        //.overlay(Color.black.opacity(0.4))
                        .tag(num)
                }
            }.tabViewStyle(PageTabViewStyle())
                //.clipShape(RoundedRectangle(cornerRadius: 5))
                //.padding()
                //.frame(height: 300)
        }
    }
}

struct ImageGallery_Previews: PreviewProvider {
    static var previews: some View {
        ImageGallery()
    }
}
