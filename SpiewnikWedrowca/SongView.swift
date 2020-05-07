//
//  SongView.swift
//  SpiewnikWedrowca
//
//  Created by Timothy Stokarski on 06/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import SwiftUI

struct SongView: View {
    
    var vm: SongViewModel
    
    var body: some View {
            List {
                Text(vm.formattedTitle())
                    .font(.system(size: 24, weight: .semibold, design: .default))
                Text(vm.formattedSongLyrics())
                    .font(.system(size: 16, weight: .regular, design: .default))
                .lineSpacing(4)
            }.navigationBarTitle(Text(""), displayMode: .inline)
    }
}

struct SongView_Previews: PreviewProvider {
    static var previews: some View {
        SongView(vm: SongViewModel(Song(number: 57, title: "Alleluja chwalcie Pana", lyrics: "Lyris lyrisc")))
    }
}

