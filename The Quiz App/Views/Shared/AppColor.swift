//
//  AppColor.swift
//  The Quiz App
//
//  Created by Nils on 7/29/24.
//

import SwiftUI

struct AppColor {
    static let background = LinearGradient(colors: [.white,.orange], startPoint: .topLeading, endPoint: .bottomTrailing)
    static let accent = Color(red: 205 / 255, green: 133 / 255, blue: 63 / 255)
    static let gradient = LinearGradient(stops: [.init(color: .white.opacity(0.3), location: 0),.init(color: .orange.opacity(0.5), location: 0.4),.init(color: .orange, location: 0.5)], startPoint: .topLeading, endPoint: .bottomTrailing)
}
