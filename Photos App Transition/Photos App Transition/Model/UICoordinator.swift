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
    var detailScrollPosition: String?
    
    func toogleView(show: Bool){
        if show {
            detailScrollPosition = selectedItem?.id
            withAnimation(.easeInOut(duration: 2), completionCriteria: .removed){
                animateView = true
            } completion: {
                self.showDetailView = true
            }
        } else {
            showDetailView = false
            withAnimation(.easeInOut(duration : 2), completionCriteria: .removed){
                animateView = false
            } completion: {
                self.resetAnimationProperties()
            }
                
        }
    }
    
    func resetAnimationProperties(){
        selectedItem = nil
        detailScrollPosition = nil 
    }
    

}

