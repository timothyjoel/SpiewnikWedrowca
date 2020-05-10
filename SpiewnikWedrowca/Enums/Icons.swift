//
//  Icons.swift
//  SpiewnikWedrowca
//
//  Created by Timothy Stokarski on 07/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import SwiftUI

enum IconImage: String {
    case favorite
    case list
    case trash
    
    var name: String {
        switch self {
        case .favorite: return "heart.fill"
        case .list: return "list.dash"
        case .trash: return "trash"
        }
    }
}

struct Icon: View {
    var image: IconImage
    var size: Image.Scale
    var weight: Font.Weight
    var color: Color
    var body: some View {
        Image(systemName: image.name)
            .font(.system(size: 20, weight: weight))
            .imageScale(size)
            .frame(width: 32, height: 32)
            .foregroundColor(color)
    }
}
