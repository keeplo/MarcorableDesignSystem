//
//  PresentableItem.swift
//  
//
//  Created by 김용우 on 2023/07/30.
//

protocol PresentableItem: Identifiable {
    var id: String { get }
}

extension PresentableItem {
    var id: String { String(describing: type(of: self)) }
}
