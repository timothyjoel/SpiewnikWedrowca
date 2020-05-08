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
                ForEach(vm.likedSongs, id: \.self) { song in
                    HStack {
                        Text("\(song.number).")
                        Text(song.title)
                    }
                }
                .onDelete(perform: vm.removeSong)
            }
            .navigationBarTitle(Text("Ulubione pieśni"))
            .onDisappear {
                LikedSongsManager.shared.save(self.vm.likedSongs)
        }
    }

}

struct FavoriteSongsView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteSongsView()
    }
}
