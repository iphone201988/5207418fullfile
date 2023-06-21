//
//  ProfileEnums.swift
//  Boss5207418
//
//  Created by Micheal Kloster on 21/06/23.
//

import Foundation
import SwiftUI

enum AccountType {
    case regular
    case verifiedIndividualAccount
    case verifiedBusinessAccount

    var type: Int {
        switch self {
        case .regular: return 1
        case .verifiedIndividualAccount: return 2
        case .verifiedBusinessAccount: return 3
        }
    }

    static func verifiedIcon(_ accountType: Int) -> Color {
        switch accountType {
        case AccountType.regular.type: return .clear
        case AccountType.verifiedIndividualAccount.type: return .blue
        case AccountType.verifiedBusinessAccount.type: return .green
        default: return .clear
        }
    }
}

enum FeedType {
    case usersPostInGridFormat
    case usersSinglePostInScrollView
    case usersVideoReelsInGridFormat

    var type: Int {
        switch self {
        case .usersPostInGridFormat: return 1
        case .usersSinglePostInScrollView: return 2
        case .usersVideoReelsInGridFormat: return 3
        }
    }
}
