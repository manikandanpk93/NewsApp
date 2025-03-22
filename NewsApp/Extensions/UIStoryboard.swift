//
//  UIStoryboard.swift
//  NewsApp
//
//  Created by Manikandan on 21/03/25.
//

import UIKit

extension UIStoryboard {
    static let newsSB: UIStoryboard = {
            return UIStoryboard.init(name: "News", bundle: nil)
        }()
}
