//
//  Ext+Font.swift
//  M2Homework7
//
//  Created by Oleg Konstantinov on 18.11.2025.
//


import UIKit




extension UIFont {

    static func interType(fontType: InterType = .regular, size: CGFloat = 16) -> UIFont {
        .init(name: fontType.rawValue, size: size) ?? .systemFont(ofSize: size)
    }
}
