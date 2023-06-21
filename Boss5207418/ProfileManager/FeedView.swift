//
//  FeedView.swift
//  Boss5207418
//
//  Created by Micheal Kloster on 21/06/23.
//

import Foundation
import SwiftUI

struct FeedView: View {
    let data: FeedModel
    var body: some View {
        Image(self.data.imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: (UIScreen.main.bounds.width - 20)/3 ,height: 100)
            .cornerRadius(5)
    }
}
