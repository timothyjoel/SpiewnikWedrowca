//
//  ContentView.swift
//  SpiewnikWedrowca
//
//  Created by Timothy Stokarski on 06/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import SwiftUI

struct HomeView: View {

    @ObservedObject var db = DatabaseManager()
    @ObservedObject var vm = HomeViewModel()
    @State var searchEntry: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                if vm.songs.isEmpty {
                    VStack (spacing: 40) {
                        ActivityIndicator()
                            .frame(width: 60, height: 60, alignment: .center)
                        Text("Ładowanie pieśni...")
                            .font(.system(size: 16, weight: .semibold, design: .default))
                            .foregroundColor(.textColor)
                    }
                    .foregroundColor(.mainColor)
                } else {
                    SearchBar(text: $searchEntry)
                    List {
                        ForEach(self.vm.songs.filter({ (song) -> Bool in
                            searchEntry.isEmpty ? true : song.title.lowercased()
                                .contains(searchEntry.lowercased())
                        }), id: \.self) { song in
                            NavigationLink(destination: SongView(song, self.db)) {
                                HStack {
                                    Text("\(song.number).")
                                    Text(song.title)
                                }
                            }
                        }
                    }
                    .navigationBarItems(leading: NavigationLink(destination: LikedSongsView(db: db), label: {
                        Icon(image: .favorite, size: .medium, weight: .semibold, color: .mainColor)
                    }), trailing: Button(action: {
                        self.vm.fetchSongs()
                    }, label: {
                        Icon(image: .reload, size: .medium, weight: .semibold, color: .mainColor)
                    }))
                    .navigationBarTitle(Text("Śpiewnik Wędrowca"))
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
