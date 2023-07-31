//
//  ContentView.swift
//  Example
//
//  Created by 김용우 on 2023/07/30.
//

import SwiftUI

struct ContentView: View {
        
    var body: some View {
        NavigationView {
            NavigationLink(
                destination: {
                    PresentableExampleView()
                }, label: {
                    Text("Presentable Example")
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
