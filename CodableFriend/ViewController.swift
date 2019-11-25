//
//  ViewController.swift
//  CodableFriend
//
//  Created by Joseph McCraw on 11/25/19.
//  Copyright © 2019 Joseph McCraw. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var friends = [Friend]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        DispatchQueue.global().async {
            do {
                let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let downloadedFriends = try decoder.decode([Friend].self, from: data)
                DispatchQueue.main.async {
                    self.friends = downloadedFriends
                    self.tableView.reloadData()
                    print(self.friends)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let friend = friends[indexPath.row]
        cell.textLabel?.text = friend.name
        cell.detailTextLabel?.text = friend.friends.map{$0.name }.joined(separator: ", ")
        return cell
    }
}

