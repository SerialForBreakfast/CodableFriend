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
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let url = "https://www.hackingwithswift.com/samples/friendface.json"
        decoder.decode([Friend].self, fromURL: url) { friends in
            self.friends = friends
            self.filteredFriends = friends
            self.tableView.reloadData()
            print(self.friends)
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

