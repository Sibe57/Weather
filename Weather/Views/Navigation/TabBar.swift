//
//  TabBar.swift
//  Weather
//
//  Created by Федор Еронин on 23.07.2022.
//

import SwiftUI

struct TabBar: View {
    
    var action: () -> Void
    
    var body: some View {
        ZStack {
            HStack {
                Button {
                    action()
                } label: {
                    Image(systemName: "mappin.and.ellipse")
                        .frame(width: 44, height: 44)
                }
                
                Spacer()
                
                NavigationLink {
                    
                } label: {
                    Image(systemName: "list.star")
                        .frame(width: 44, height: 44)
                }
            }
            .font(.title3)
            .foregroundColor(.white)
            .padding(EdgeInsets(top: 20, leading: 20, bottom: 24, trailing: 24))
            
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(action: {})
            .preferredColorScheme(.dark)
    }
}
