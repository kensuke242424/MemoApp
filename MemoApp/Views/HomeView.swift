//
//  ContentView.swift
//  MemoApp
//
//  Created by 中川賢亮 on 2022/09/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {

        MemoListView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
