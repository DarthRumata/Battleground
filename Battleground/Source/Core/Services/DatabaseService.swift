//
//  DatabaseService.swift
//  Battleground
//
//  Created by Stas Kirichok on 01-06-2019.
//  Copyright © 2019 Stas Kirichok. All rights reserved.
//

import Foundation
import SQLite

class DatabaseService {

    static let shared = DatabaseService()
    private let db: Connection

    private init() {
        do {
            let path = NSSearchPathForDirectoriesInDomains(
                .documentDirectory, .userDomainMask, true
                ).first!
            db = try Connection("\(path)/db.sqlite3")
        } catch let error {
            print(error)
            fatalError(error.localizedDescription)
        }
    }

    func execute(statement: String) throws -> Statement {
        return try db.run(statement)
    }

    func fetch(query: QueryType) throws -> AnySequence<Row>  {
        return try db.prepare(query)
    }

}
