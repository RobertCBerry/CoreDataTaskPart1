//
//  SavedContentTableViewController.swift
//  CoreDemoPart1Task
//
//  Created by Robert Berry on 2/23/18.
//  Copyright © 2018 Robert Berry. All rights reserved.
//

import UIKit
import CoreData 

class SavedContentTableViewController: UITableViewController { 
    
    // MARK: Properties
    
    let favoritesEntity = "Favorites"
    
    var favorites = [Favorites]()
    
    override func viewDidLoad() {
       super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // Configure the cell...
        
        // Retrieve the NSManagedObject found at a particular index in the favorites array. 
        
        let favorite = favorites[indexPath.row]
        
        // Retrieve food, movie, and book attributes of NSManagedObject with valueForKey(), and create a string with these values that can be used on the table view cell.
        
        let favoriteFood = favorite.food
        let favoriteMovie = favorite.movie
        let favoriteBook = favorite.book
        
        cell.textLabel?.text = "Favorite Food: \(favoriteFood!), Favorite Movie: \(favoriteMovie!),  Favorite Book: \(favoriteBook!)"
        
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: favoritesEntity)
        
        do {
            let results = try managedContext.fetch(fetchRequest)
            favorites = results as! [Favorites]
            
        } catch let error as NSError {
            print("Fetching Error: \(error.userInfo)")
        }
        
    }
}
