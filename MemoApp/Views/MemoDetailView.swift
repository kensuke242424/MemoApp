//
//  MemoDetailView.swift
//  MemoApp
//
//  Created by 中川賢亮 on 2022/09/23.
//

import SwiftUI

struct MemoDetailView: View {

    // フォーカスが当たるTextFieldを判断するためのenum
    enum Field { case text }
    @FocusState private var foucsedField: Field?

    let listIndex: Int
    let memoTime: String
    @State var newMemoTitle: String
    @State var newMemoText: String
    @StateObject var memoVM: MemoViewModel
    // Home画面に戻るためのプロパティ
    @Environment(\.presentationMode) private var presentationMode

    var body: some View {

        VStack {

            Text(memoTime)
                .padding(.top)

                .foregroundColor(.gray)
            TextField("タイトル", text: $newMemoTitle)
                .padding(20)
                .frame(width: 400, height: 50)
                .font(.title)

            // メモ詳細を記入するテキストボックス
            TextEditor(text: $newMemoText)
                .padding(.horizontal)
                .focused($foucsedField, equals: .text)

        } // VStack
        //        .navigationBarBackButtonHidden(true)
        .navigationBarTitle(Text(""), displayMode: .inline)

        .onAppear {
            foucsedField = .text
        } // onAppear
        .onDisappear {

            if memoVM.memosData.indices.contains(listIndex) {

                memoVM.memosData[listIndex].title = newMemoTitle
                memoVM.memosData[listIndex].text = newMemoText

                if memoVM.memosData[listIndex].title.isEmpty && memoVM.memosData[listIndex].text.isEmpty {

                    memoVM.memosData.remove(at: listIndex)
                }
            }


        } // onDisappear
    } // body
} // View
struct MemoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MemoDetailView(listIndex: 0,
                       memoTime: "9月16日",
                       newMemoTitle: "newMemoTitle",
                       newMemoText: "newMemoText",
                       memoVM: MemoViewModel())
    }
}
