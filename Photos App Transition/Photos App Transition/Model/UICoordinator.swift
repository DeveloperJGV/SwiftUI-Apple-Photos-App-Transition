//
//  UICoordinator.swift
//  Photos App Transition
//
//  Created by User on 08/05/24.
//

import SwiftUI

@Observable
class UICoordinator{
    var items: [Item] = sampleItem.compactMap({
        Item(title: $0.title, image: $0.image, previewImage: $0.image)
    })
    
    var selectedItem: Item?
    var animateView: Bool = false
    var showDetailView: Bool = false
}
