//
//  ViewController.swift
//  CodableFriend
//
//  Created by Joseph McCraw on 11/25/19.
//  Copyright © 2019 Joseph McCraw. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UISearchResultsUpdating {
    
    
    var friends = [Friend]()
    var filteredFriends = [Friend]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let search = UISearchController(searchResultsController: nil)
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Find a friend"
        search.searchResultsUpdater = self
        navigationItem.searchController = search
        
        
        DispatchQueue.global().async {
            do {
                let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let downloadedFriends = try decoder.decode([Friend].self, from: data)
                DispatchQueue.main.async {
                    self.friends = downloadedFriends
                    self.filteredFriends = downloadedFriends
                    self.tableView.reloadData()
                    print(self.friends)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredFriends.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let friend = filteredFriends[indexPath.row]
        cell.textLabel?.text = friend.name
        cell.detailTextLabel?.text = friend.friendList
        return cell
    }
    func updateSearchResults(for searchController: UISearchController) {
        filteredFriends = friends.matching(searchController.searchBar.text)
        tableView.reloadData()
    }
}

