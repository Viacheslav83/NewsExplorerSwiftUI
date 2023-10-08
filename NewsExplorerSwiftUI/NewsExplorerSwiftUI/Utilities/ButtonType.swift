//
//  ButtonType.swift
//  NewsExplorerSwiftUI
//
//  Created by Viacheslav Markov on 07.10.2023.
//

import SwiftUI

enum ButtonType {
    case next
    case skip
    case finish
    
    public var title: String {
        switch self {
        case .next:
            return "Next"
        case .skip:
            return "Skip"
        case .finish:
            return "Finish"
        }
    }
    
    public var cornerRadius: CGFloat {
        switch self {
        case .next, .skip, .finish:
            return 8
        }
    }
    
    public var buttonHeight: CGFloat {
        switch self {
        case .next, .skip, .finish:
            return 56
        }
    }
    
    public var borderColor: Color? {
        switch self {
        case .skip, .finish:
            return Color(ColorType.customBlueColor.rawValue)
        case .next:
            return nil
        }
    }
    
    public var buttonTapped: ButtonType {
        return self
    }
    
    public var backgroundColor: Color {
        switch self {
        case .next:
            return Color(ColorType.customBlueColor.rawValue)
        case .skip, .finish:
            return Color(ColorType.baseColor.rawValue)
        }
    }
}
