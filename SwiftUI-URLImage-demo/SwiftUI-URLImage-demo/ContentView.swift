//
//  ContentView.swift
//  SwiftUI-URLImage-demo
//
//  Created by kazunori.aoki on 2021/11/26.
//

import SwiftUI

import URLImage           // https://github.com/dmytro-anokhin/url-image
import AdvancedScrollView // https://github.com/dmytro-anokhin/advanced-scrollview

struct ContentView: View {

    let imageUrl = URL(string:  "https://www.omotesandohills.com/information/about/images/index/pic_01.jpg")!


    var body: some View {

        // simple
//        URLImage(imageUrl) { image in
//            image
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//        }

        // 色々ハンドリング
//        URLImage(imageUrl) {
//
//            // なかったとき
//            Text("Emptyだよ")
//
//        } inProgress: { progress in
//
//            // 進行中
//            Text("Progress: \(Double(progress ?? 0.0) )")
//
//        } failure: { error, retry in
//
//            // エラー時
//            VStack {
//                Text("Error: \(error.localizedDescription)")
//
//                // リトライもできる
//                Button(action: retry) {
//                    Text("Retry")
//                }
//            }
//
//        } content: { image in
//            // 成功時
//            image
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//        }

        // 画像の最大値等、指定できる
//        URLImage(imageUrl) { image in
//            image
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//        }
//        .environment(\.urlImageOptions,
//                      URLImageOptions(fetchPolicy: .returnStoreDontLoad, // Cacheファイルを使うか
//                                      loadOptions: .loadOnAppear, // ロードタイミングの設定
//                                      urlRequestConfiguration: nil, // request setting
//                                      maxPixelSize: nil)) // 最大サイズ

        // 画像情報も予め取得可能
//        URLImage(imageUrl) { image, info in
//            if info.size.width < 1024.0 {
//                image
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//            } else {
//                image
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//            }
//        }

        // 画像の拡大縮小
//        URLImage(imageUrl) { image in
//            AdvancedScrollView { _ in
//                image
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//            }
//        }

        // 画像の拡大縮小（限度も調整できる）
        URLImage(imageUrl) { image in
            let magnification = Magnification(range: 1.0...4.0,
                                              initialValue: 1.0,
                                              isRelative: true) // ビューのフレームを基準にするか
            AdvancedScrollView(magnification: magnification, isScrollIndicatorVisible: true) { _ in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
