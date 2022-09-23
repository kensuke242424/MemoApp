//
//  MemoViewModel.swift
//  MemoApp
//
//  Created by 中川賢亮 on 2022/09/23.
//

import Foundation
import SwiftUI

class MemoViewModel: ObservableObject {

    init() { print("<<<<<<<<<  MemoViewModel_init  >>>>>>>>>") }

    @Published var memosData: [MemoData] = [MemoData(time: "9月16日", title: "サンプルメモ", text: "サンプルのメモです。")]

    func addMemoData(title: String, text: String) {

        print("<addMemoData実行>")

        // 作成時の日付を作成
        let date = Date()
        let dateFormatter =  DateFormatter()
        dateFormatter.dateFormat = "MM月dd日"
        let addTime = dateFormatter.string(from: date)

        // メモデータを先頭に格納
        memosData.insert(MemoData(time: addTime, title: title, text: text), at: 0)

        print("[保存したメモデータ]")
        print("　addTime: \(addTime)")
        print("　title: \(title)")
        print("　text: \(text)")

    } // func addMessageData
    deinit { print("<<<<<<<<<  MemoViewModel_deinit  >>>>>>>>>") }
}
