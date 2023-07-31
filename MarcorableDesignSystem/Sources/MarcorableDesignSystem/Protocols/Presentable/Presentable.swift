//
//  Presentable.swift
//  
//
//  Created by 김용우 on 2023/07/30.
//

import SwiftUI

// MARK: - FullScreenCover
public protocol FullScreenCoverPresentable {
    associatedtype FullScreenCoverItem
    
    var fullScreenCoverItem: FullScreenCoverItem? { get set }
    var isPresentedFullScreenCover: Binding<Bool> { get }
}

extension FullScreenCoverPresentable where Self: AnyObject {
    
    public var isPresentedFullScreenCover: Binding<Bool> {
        .init(
            get: { self.fullScreenCoverItem == nil ? false : true },
            set: { _ in
                Task {
                    await MainActor.run { [weak self] in
                        self?.fullScreenCoverItem = nil
                    }
                }
            }
        )
    }
    
}

// MARK: - Sheet
public protocol SheetPresentable {
    associatedtype SheetItem
    
    var sheetItem: SheetItem? { get set }
    var isPresentedSheet: Binding<Bool> { get }
}

extension SheetPresentable where Self: AnyObject {
    
    public var isPresentedSheet: Binding<Bool> {
        .init(
            get: { self.sheetItem == nil ? false : true },
            set: { _ in
                Task {
                    await MainActor.run { [weak self] in
                        self?.sheetItem = nil
                    }
                }
            }
        )
    }
    
}
