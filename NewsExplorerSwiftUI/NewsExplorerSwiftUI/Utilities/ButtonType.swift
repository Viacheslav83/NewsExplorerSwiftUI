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
    case logout
    case custom(text: String)
    
    public var title: String {
        switch self {
        case .next:
            return "Next"
        case .skip:
            return "Skip"
        case .finish:
            return "Finish"
        case .logout:
            return "Logout"
        case .custom(text: let text):
            return text
        }
    }
    
    public var cornerRadius: CGFloat {
        switch self {
        case .next, .skip, .finish, .logout, .custom:
            return 8
        }
    }
    
    public var buttonHeight: CGFloat {
        switch self {
        case .next, .skip, .finish, .logout, .custom:
            return 56
        }
    }
    
    public var borderColor: Color? {
        switch self {
        case .skip, .finish:
            return Color(ColorType.customBlueColor.rawValue)
        case .next, .logout, .custom:
            return nil
        }
    }
    
    public var backgroundColor: Color {
        switch self {
        case .next:
            return Color(ColorType.customBlueColor.rawValue)
        case .skip, .finish, .custom:
            return Color(ColorType.baseColor.rawValue)
        case .logout:
            return Color(ColorType.customRedColor.rawValue)
        }
    }
}
