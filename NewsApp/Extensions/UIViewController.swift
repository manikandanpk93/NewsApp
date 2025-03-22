//
//  UIViewController.swift
//  NewsApp
//
//  Created by Manikandan on 21/03/25.
//

import UIKit

extension UIViewController {
    static var name: String {
        return NSStringFromClass(self).components(separatedBy: ".").last ?? ""
    }
}
