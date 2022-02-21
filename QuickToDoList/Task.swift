//
//  Task.swift
//  QuickToDoList
//
//  Created by Patrick Serrano on 2/20/22.
//

import Foundation
import RealmSwift

class Task: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title = ""
    @Persisted var completed = false
}
