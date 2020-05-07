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
            List {
                Text("Poop")
            }
            .navigationBarTitle(Text("Ulubione pieśni"))
    }
}

struct FavoriteSongsView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteSongsView()
    }
}
