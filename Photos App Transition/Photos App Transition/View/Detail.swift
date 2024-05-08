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
            
            
            VStack(spacing: 0){
                NavigationBar()
                
                ScrollView(.horizontal){
                    LazyHStack(spacing: 0){
                        ForEach(coordinator.items){
                             item in
                            ImageView(item, size: size)
                        }
                    }
                    .scrollTargetLayout()
                }
            }
            
            .scrollTargetBehavior(.paging)
            .scrollPosition(id: .init(get: {
                return coordinator.detailScrollPosition
            }, set: {
                coordinator.detailScrollPosition = $0
            }))
            .background {
                if let selectedItem = coordinator.selectedItem{
                    Rectangle()
                        .fill(.clear)
                        .anchorPreference(key: HeroKey.self, value: .bounds, transform: { anchor in
                            return [selectedItem.id + "DEST": anchor]
                        })
                }
            }
        }
        .opacity(coordinator.showDetailView ? 1 : 0)
        .onAppear{
            coordinator.toogleView(show: true)
        }
    }
    
  
    @ViewBuilder
    func NavigationBar() -> some View {
        HStack{
            Button(action: {coordinator.toogleView(show: false)}, label: {
                HStack(spacing: 2){
                    Image(systemName: "chevron.left")
                        .font(.title3)
                    Text ("Regresar")
                }
            })
        }
        .padding([.top, .horizontal], 15)
        .padding(.bottom, 10)
        .background(.ultraThinMaterial)
        .offset(y: coordinator.showDetailView ? 0 : -120)
        .animation(.easeInOut(duration: 0.15), value: coordinator.showDetailView)
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
