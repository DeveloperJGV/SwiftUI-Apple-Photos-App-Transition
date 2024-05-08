//
//  Detail.swift
//  Photos App Transition
//
//  Created by User on 08/05/24.
//

import SwiftUI

struct Detail: View {
    @Environment(UICoordinator.self) private var coordinator
    var body: some View {
        GeometryReader{
            let size =  $0.size
            
            ScrollView(.horizontal){
                LazyHStack(spacing: 0){
                    ForEach(coordinator.items){
                         item in
                        ImageView(item, size: size)
                    }
                }
                .scrollTargetLayout()
            }
            
            .scrollTargetBehavior(.paging)
        }
        .opacity(coordinator.showDetailView ? 1 : 0)
    }
    
    @ViewBuilder
    func ImageView(_ item: Item, size: CGSize) -> some View {
        if let image = item.image{
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: size.width, height: size.height)
                .clipped()
                .contentShape(.rect)
        }
    }
}

#Preview {
    ContentView()
}
