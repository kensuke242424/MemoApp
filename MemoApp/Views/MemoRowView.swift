//
//  MemoRowView.swift
//  MemoApp
//
//  Created by 中川賢亮 on 2022/09/23.
//

import SwiftUI

struct MemoRowView: View {

    let memoTime: String
    let memotitle: String
    let memoText: String

    var body: some View {

        VStack(alignment: .leading) {

            Text(memotitle)
                .font(.headline)
                .padding(.horizontal, 20.0)
                .padding(.bottom, 5)
                .lineLimit(1)
            HStack {
                Text("\(memoTime)")
                    .opacity(0.5)
                Spacer()
                Text(memoText)
                    .opacity(0.5)
                // 行の表示数を制限する
                    .lineLimit(1)

            } // HStack
            .padding(.horizontal, 20.0)
        } // VStack
    }
}

struct MemoRowView_Previews: PreviewProvider {
    static var previews: some View {
        MemoRowView(memoTime: "time", memotitle: "title", memoText: "text")
    }
}
