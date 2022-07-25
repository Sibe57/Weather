//
//  WeatherView.swift
//  Weather
//
//  Created by Федор Еронин on 25.07.2022.
//

import SwiftUI

struct WeatherView: View {
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
        }
        .overlay {
            NavigationBar()
        }
        .navigationBarHidden(true)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
            .preferredColorScheme(.dark)
    }
}
