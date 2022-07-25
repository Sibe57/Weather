//
//  HomeView.swift
//  Weather
//
//  Created by Федор Еронин on 23.07.2022.
//

import SwiftUI
import BottomSheet

enum BottomSheetPosition: CGFloat, CaseIterable {
    case top = 0.83
    case middle = 0.385
}

struct HomeView: View {
    @State var bottomSeetPosition: BottomSheetPosition = .middle
    @State var bottomSheetTranslation: CGFloat = BottomSheetPosition.middle.rawValue
    @State var hasDragged = false
    
    var bottomSheetTranslationProrated: CGFloat {
        (bottomSheetTranslation - BottomSheetPosition.middle.rawValue) /
        (BottomSheetPosition.top.rawValue - BottomSheetPosition.middle.rawValue)
    }
    var body: some View {
        NavigationView {
            GeometryReader { geomerty in
                let screenHeight = geomerty.size.height +
                geomerty.safeAreaInsets.top +
                geomerty.safeAreaInsets.bottom
                
                let imageOffset = screenHeight + 36
                ZStack {
                    Color.background
                        .ignoresSafeArea()
                    Image("Background")
                        .resizable()
                        
                        .offset(y: -bottomSheetTranslationProrated * imageOffset)
                    
                    Image("House")
                        .frame(maxHeight: .infinity, alignment: .top)
                        .padding(.top, 257)
                        .offset(y: -bottomSheetTranslationProrated *
                                imageOffset * 0.8)
                    
                    VStack(spacing: -10 * (1 - bottomSheetTranslationProrated)) {
                        Text("Montreal")
                            .font(.largeTitle)
                        VStack {
                            Text(attributedString)
                            Text("H:24° L:18°")
                                .font(.title3.weight(.semibold))
                                .opacity(1 - bottomSheetTranslationProrated)
                        }
                        
                        Spacer()
                    }
                    .padding(.top, 51)
                    .offset(y: -bottomSheetTranslation * 46)
                    
                    BottomSheetView(position: $bottomSeetPosition) {
                    } content: {
                        ForecastView(bottomSheetTranslationProrated:
                                        bottomSheetTranslationProrated)
                    }
                    .onBottomSheetDrag { translation in
                        bottomSheetTranslation = translation / screenHeight
                        
                        withAnimation(.easeInOut) {
                            
                            hasDragged =
                                (bottomSeetPosition == BottomSheetPosition.top)
                        }
                    }

                    TabBar(action: {
                        bottomSeetPosition = .top
                    })
                    .ignoresSafeArea()
//                    .offset(y: bottomSheetTranslationProrated * 115)
                }
                .navigationBarHidden(true)
            }
        }
    }
    private var attributedString: AttributedString {
        var string = AttributedString("19°" + (hasDragged ? " | " : "\n") +
                                      "Mostly Clear")
        
        if let temp = string.range(of: "19°") {
            string[temp].font = .system(
                size: (96 - (bottomSheetTranslationProrated * (96 - 20))),
                weight: hasDragged ? .semibold : .thin)
            string[temp].foregroundColor = hasDragged ? .secondary : .primary
        }
        
        if let pipe = string.range(of: " | ") {
            string[pipe].font = .title3.weight(.semibold)
            string[pipe].foregroundColor =
                .secondary
                .opacity(bottomSheetTranslationProrated)
        }
        if let weather = string.range(of: "Mostly Clear") {
            string[weather].font = .title3.weight(.semibold)
            string[weather].foregroundColor = .secondary
        }
        return string
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}
