//
//  UITableViewCell.swift
//  NewsApp
//
//  Created by Manikandan on 21/03/25.
//

import UIKit

extension UITableViewCell {
    static var name: String {
        return NSStringFromClass(self).components(separatedBy: ".").last ?? ""
    }
}

extension UITableView {
    func registerNib(name : String) {
        self.register(UINib.init(nibName:name, bundle: .main), forCellReuseIdentifier:name)
    }
}
