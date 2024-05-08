//
//  Item.swift
//  Photos App Transition
//
//  Created by User on 08/05/24.
//

import SwiftUI

struct Item: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var title: String
    var image: UIImage?
    var previewImage: UIImage?
    var appereared: Bool = false
}

var sampleItem: [Item] = [
    .init(title: "First Image", image: UIImage(named: "Pic001")),
    .init(title: "Second Image", image: UIImage(named: "Pic002")),
    .init(title: "Third Image", image: UIImage(named: "Pic003")),
    .init(title: "Fourth Image", image: UIImage(named: "Pic004")),
    .init(title: "Fifth Image", image: UIImage(named: "Pic005")),
    .init(title: "Sixth Image", image: UIImage(named: "Pic006")),
    .init(title: "Seventh Image", image: UIImage(named: "Pic007")),
    .init(title: "Last Image", image: UIImage(named: "Pic008"))
]
