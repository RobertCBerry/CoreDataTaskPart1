//
//  Favorites+CoreDataProperties.swift
//  CoreDemoPart1Task
//
//  Created by Robert Berry on 2/23/18.
//  Copyright © 2018 Robert Berry. All rights reserved.
//
//

import Foundation
import CoreData


extension Favorites {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favorites> {
        return NSFetchRequest<Favorites>(entityName: "Favorites")
    }

    @NSManaged public var book: String?
    @NSManaged public var food: String?
    @NSManaged public var movie: String?

}
