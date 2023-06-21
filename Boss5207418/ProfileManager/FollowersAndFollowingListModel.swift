//
//  FollowersAndFollowingListModel.swift
//  Boss5207418
//
//  Created by Micheal Kloster on 21/06/23.
//

import Foundation

struct FollowersAndFollowingListModel: Identifiable {
    var name: String
    var users: [FollowerOrFollowingUser]
    var id: String { name }

    static func preparedListData(_ header: String) -> [FollowersAndFollowingListModel] {
        var users = [FollowerOrFollowingUser]()
        let user1 = FollowerOrFollowingUser(name: "John", bio: "Populate data in list goes")
        let user2 = FollowerOrFollowingUser(name: "Boss", bio: "Populate data in list goes")
        let user3 = FollowerOrFollowingUser(name: "Michael", bio: "Populate data in list goes")
        let user4 = FollowerOrFollowingUser(name: "Kenth", bio: "Populate data in list goes")
        users = [user1, user2, user3, user4]

        var usersList = [FollowersAndFollowingListModel]()
        let list = FollowersAndFollowingListModel(name: header, users: users)
        usersList = [list]
        return usersList
    }
}

struct FollowerOrFollowingUser: Identifiable {
    var name: String
    var bio: String
    var id: String { name }
}
