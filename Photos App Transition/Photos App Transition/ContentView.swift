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
        }
    }
}

#Preview {
    ContentView()
}
