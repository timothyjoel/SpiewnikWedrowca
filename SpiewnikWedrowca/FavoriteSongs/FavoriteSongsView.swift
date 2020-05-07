//
//  FavoriteSongsView.swift
//  SpiewnikWedrowca
//
//  Created by Timothy Stokarski on 07/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import SwiftUI

struct FavoriteSongsView: View {
    
    @ObservedObject var vm = FavoriteSongsViewModel()
    
    var body: some View {
        NavigationView {
            List {
                Text("Poop")
            }
            .navigationBarItems(leading: Button(action: {
                print("Favorites")
            }, label: {
                Icon(image: .favorite, size: .medium, weight: .semibold, color: .main)
            }), trailing: Button(action: {
                print("Lists")
            }, label: {
                Icon(image: .list, size: .medium, weight: .semibold, color: .main)
            }))
                .navigationBarTitle(Text("Śpiewnik Wędrowca"))
        }
    }
}

struct FavoriteSongsView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteSongsView()
    }
}
