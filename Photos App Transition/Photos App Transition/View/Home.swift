//
//  Home.swift
//  Photos App Transition
//
//  Created by User on 08/05/24.
//

import SwiftUI

struct Home: View {
    @Environment(UICoordinator.self) private var coordinator
    var body: some View {
        ScrollView(.vertical){
            LazyVGrid(columns: Array(repeating: GridItem(spacing: 3), count: 3),spacing: 3)
                {
                    ForEach(coordinator.items){
                        item in
                        GridImageView(item)
                            .onTapGesture {
                                coordinator.selectedItem = item
                            }
                    }
                }
        }
        .navigationTitle("Imagenes Recientes")
    }
    @ViewBuilder
    func GridImageView(_ item: Item ) -> some View{
        GeometryReader{
            let size = $0.size
            
            Rectangle()
                .fill(.clear)
                .anchorPreference(key: HeroKey.self, value: .bounds, transform: { anchor in
                    return [item.id + "SOURCE": anchor]
                })
            
            
            if let previewImage = item.previewImage{
                Image(uiImage: previewImage)
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .frame(width: size.width, height: size.height)
                    .clipped()
                    .opacity(coordinator.selectedItem?.id == item.id ? 0 : 1)
            }
        }
        .frame(height: 130)
        .contentShape(.rect)
    }
    
}

#Preview {
    ContentView()
}
