//
//  Grid.swift
//  Set-Game
//
//  Created by Duong Pham on 1/1/21.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    private var items = [Item]()
    private var nearAspectRatio: Double
    private var viewForItem: (Item) -> ItemView
    
    init(items: [Item], nearAspectRatio: Double, viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.nearAspectRatio = nearAspectRatio
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { geometry in
            let layout = GridLayout(itemCount: items.count, nearAspectRatio: nearAspectRatio, in: geometry.size)
            ForEach(items) { item in
                viewForItem(item)
                    .frame(width: layout.itemSize.width, height: layout.itemSize.height)
                    .position(layout.location(ofItemAt: items.firstIndex(matching: item)!))
            }
        }
    }
}
