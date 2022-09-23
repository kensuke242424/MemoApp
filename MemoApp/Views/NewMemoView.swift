//
//  NewMemoView.swift
//  MemoApp
//
//  Created by 中川賢亮 on 2022/09/23.
//

import SwiftUI

struct NewMemoView: View {

    // フォーカスが当たるTextFieldを判断するためのenum
    enum Field {
        case title
        case text
    }

    @FocusState private var foucsedField: Field?

    @StateObject var memoVM: MemoViewModel
    @State private var newMemoTitle = ""
    @State private var newMemoText = ""

    // Home画面に戻るためのプロパティ
    @Environment(\.presentationMode) private var presentationMode


    var body: some View {

        VStack {
            // メモのタイトルを記入するテキストボックス
            TextField("タイトル", text: $newMemoTitle)
                .padding(20)
                .frame(width: 400, height: 50)
                .font(.title)
                .focused($foucsedField, equals: .title)
                .onSubmit {
                    foucsedField = .text
                }

            // メモ詳細を記入するテキストボックス
            TextEditor(text: $newMemoText)
                .padding(.horizontal)
                .focused($foucsedField, equals: .text)

        } // VStack
        .navigationBarTitle(Text(""), displayMode: .inline)
        .navigationBarItems(trailing: Button("完了") {

            // タイトル、テキスト両方に値がなかった場合は保存処理を行わない
            if newMemoTitle.isEmpty && newMemoText.isEmpty {
                print("新規メモの内容が空です。保存しませんでした")
            } else {
                // メモ保存メソッド
                memoVM.addMemoData(title: newMemoTitle, text: newMemoText)
            }

            // 親Viewへ遷移
            self.presentationMode.wrappedValue.dismiss()

        }.padding())

        // .onApperはView表示時に発生する処理のこと
        // NewMemoViewへの遷移から、0.6秒ずらしてenumの値を更新し、キーボード表示の処理を行う
        .onAppear() {

//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                foucsedField = .title
//            }
        }

    } // body
} // View
struct NewMemoView_Previews: PreviewProvider {
    static var previews: some View {
        NewMemoView(memoVM: MemoViewModel())
    }
}
