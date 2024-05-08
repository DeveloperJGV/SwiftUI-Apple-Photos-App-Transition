//
//  ContentView.swift
//  Photos App Transition
//
//  Created by User on 08/05/24.
//

import SwiftUI

struct ContentView: View {
    var coordinator: UICoordinator = .init()
    var body: some View {
        NavigationStack{
            Home()
                .environment(coordinator)
                .allowsHitTesting(coordinator.selectedItem == nil)
        }
        .overlay{
            if coordinator.selectedItem != nil {
                Detail()
                    .environment(coordinator)
                    .allowsHitTesting(coordinator.showDetailView)
            }
        }
    }
}

#Preview {
    ContentView()
}
