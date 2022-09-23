//
//  MemoListView.swift
//  MemoApp
//
//  Created by 中川賢亮 on 2022/09/23.
//

import SwiftUI

struct MemoListView: View {

    // MemoModelのデータを呼び出し
    @StateObject var memoVM = MemoViewModel()
    // 新規メモViewへの遷移フラグを管理
    @State private var isActive = false

    var body: some View {
        NavigationView {

            VStack {
                List {
                    ForEach(0 ..< memoVM.memosData.count, id: \.self) { num in

                        NavigationLink(destination: {
                            MemoDetailView(listIndex: num,
                                           memoTime: memoVM.memosData[num].time,
                                           newMemoTitle: memoVM.memosData[num].title,
                                           newMemoText: memoVM.memosData[num].text,
                                           memoVM: memoVM)
                        }, label: {
                            MemoRowView(memoTime: memoVM.memosData[num].time,
                                        memotitle: memoVM.memosData[num].title,
                                        memoText: memoVM.memosData[num].text)

                        }) // NavigationLink
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                } // List
                // リストの標準システム バックグラウンドを非表示
                .scrollContentBackground(.hidden)
                .navigationBarItems(trailing: EditButton())
                .navigationTitle(Text("メモ"))

                // 新規メモViewへの画面遷移に使用
                // 下部のボタンとisActiveプロパティで紐づけている
                NavigationLink(destination: NewMemoView(memoVM:  memoVM), isActive: $isActive) {
                    EmptyView()
                }

                // 新規メモView遷移ボタン
                Button(action: {
                    // 新規メモデータをメモデータ配列のindex[0](最前列)へ格納
                    isActive.toggle()
                }) {
                    Image(systemName: "square.and.pencil")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .padding(.top)
                } // Button
            } // VStack
            .background(Color.background)
            .onAppear() {

                // メモリスト内に要素なしのメモがあれば、配列から削除
//                memoVM.memosData.removeAll(where: { $0.title.isEmpty && $0.text.isEmpty })
            }
        } // NavigationView
    }// body

    // デリートメソッド
    func delete(offsets: IndexSet) {
        memoVM.memosData.remove(atOffsets: offsets)
    }

    // 編集メソッド
    private func move(offsets: IndexSet, index: Int) {
        memoVM.memosData.move(fromOffsets: offsets, toOffset: index)
    }
}



struct MemoListView_Previews: PreviewProvider {
    static var previews: some View {
        MemoListView()
    }
}
