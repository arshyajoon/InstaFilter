//
//  Movie+CoreDataProperties.swift
//  CoreDataProject.swift
//
//  Created by Arshya GHAVAMI on 2/23/21.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var director: String?
    @NSManaged public var tittle: String?
    @NSManaged public var year: Int16

}

extension Movie : Identifiable {

}
