//
//  UsersRepository.swift
//  Battleground
//
//  Created by Stas Kirichok on 01-06-2019.
//  Copyright © 2019 Stas Kirichok. All rights reserved.
//

import Foundation
import SQLite
import RxSwift

private let userIdKey = "user_id_key"

enum UsersRepositoryError: LocalizedError {
    case userNotCreated
    case userNotFound
}

class UsersRepository {

    private let databaseService: DatabaseService
    private let table = Table("users")

    private var currentUserId: String? {
        get {
            return UserDefaults.standard.string(forKey: userIdKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: userIdKey)
        }
    }

    init(databaseService: DatabaseService) {
        self.databaseService = databaseService
    }

    func getCurrentUser() -> Single<User> {
        guard let userId = currentUserId else {
            return Single.error(UsersRepositoryError.userNotCreated)
        }
        return Single.create(subscribe: { [unowned self] observer -> Disposable in
            DispatchQueue.global().async {
                let id = Expression<String>("id")
                let query = self.table.where(id == userId)
                do {
                    let result = Array(try self.databaseService.fetch(query: query))
                    if let user: User = try result.first.map({ try $0.decode() }) {
                        observer(.success(user))
                    } else {
                        observer(.error(UsersRepositoryError.userNotFound))
                    }
                } catch let error {
                    print(error)
                    observer(.error(error))
                }
            }

            return Disposables.create()
        })
    }

}
