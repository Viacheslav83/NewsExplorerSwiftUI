//
//  View+Extension.swift
//  NewsExplorerSwiftUI
//
//  Created by Viacheslav Markov on 08.10.2023.
//

import SwiftUI

extension View {
    var appDelegate: AppDelegate? {
        UIApplication.shared.delegate as? AppDelegate
    }
}
