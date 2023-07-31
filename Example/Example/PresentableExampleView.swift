//
//  PresentableExampleView.swift
//  Example
//
//  Created by 김용우 on 2023/07/31.
//

import SwiftUI
import MarcorableDesignSystem

final class PresentableExampleViewModel: ObservableObject, FullScreenCoverPresentable, SheetPresentable {
    
    enum FullScreenCoverItem: PresentableItem {
        case alpha
        case beta(String)
    }
    
    enum SheetItem: PresentableItem {
        case delta
    }
    
    @Published var fullScreenCoverItem: FullScreenCoverItem?
    @Published var sheetItem: SheetItem?
}

struct PresentableExampleView: View {
    
    @StateObject var viewModel: PresentableExampleViewModel = .init()
    
    var body: some View {
        ZStack {
            viewModel.isPresentedSheet.wrappedValue ? Color.red : Color.white
                
            VStack {
                Button(
                    action: {
                        viewModel.fullScreenCoverItem = .alpha
                    }, label: {
                        Text("Present FullScreenCover Alpha View")
                    }
                )
                Button(
                    action: {
                        viewModel.fullScreenCoverItem = .beta("There is an Item")
                    }, label: {
                        Text("Present FullScreenCover Beta View")
                    }
                )
                Button(
                    action: {
                        viewModel.sheetItem = .delta
                    }, label: {
                        Text("Present Sheet Delta View")
                    }
                )
            }
        }
        .fullScreenCover(item: $viewModel.fullScreenCoverItem) { item in
            switch item {
                case .alpha:
                    DismissableView(title: "Alpha")
                case .beta(let item):
                    DismissableView(title: "Beta", item: item)
            }
        }
        .sheet(item: $viewModel.sheetItem) { item in
            switch item {
                case .delta:
                    DismissableView(title: "Delta")
            }
        }
    }
}

struct DismissableView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let title: String
    let item: String?
    
    init(title: String, item: String? = nil) {
        self.title = title
        self.item = item
    }
    
    var body: some View {
        ZStack {
            Color.gray
            
            VStack {
                if let text = item {
                    Text(text)
                }
                Text("\(title) View")
                    .foregroundColor(.white)
                Button(
                    action: {
                        dismiss()
                    }, label: {
                        Text("Dismiss View")
                    }
                )
            }
        }
    }
    
}

struct PresentableExampleView_Previews: PreviewProvider {
    static var previews: some View {
        PresentableExampleView()
    }
}
