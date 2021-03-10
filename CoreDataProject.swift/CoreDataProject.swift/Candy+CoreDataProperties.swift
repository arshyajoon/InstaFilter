//
//  Candy+CoreDataProperties.swift
//  CoreDataProject.swift
//
//  Created by Arshya GHAVAMI on 2/26/21.
//
//

import Foundation
import CoreData


extension Candy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?

}

extension Candy : Identifiable {

}
