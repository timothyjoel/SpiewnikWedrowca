//
//  Colors.swift
//  SpiewnikWedrowca
//
//  Created by Timothy Stokarski on 07/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import SwiftUI

enum Colors {
    case label
    case main
    case background
    
    var name: Color {
        switch self {
        case .label: return Color(UIColor.label)
        case .main: return Color(UIColor.systemPink)
        case .background: return Color(UIColor.systemBackground)
        }
    }
}
