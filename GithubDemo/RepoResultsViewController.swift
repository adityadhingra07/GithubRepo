//
//  ViewController.swift
//  GithubDemo
//
//  Created by Nhan Nguyen on 5/12/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit
import MBProgressHUD
import AFNetworking

// Main ViewController
class RepoResultsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var reposTableView: UITableView!
    var searchBar: UISearchBar!
    var searchSettings = GithubRepoSearchSettings()
    
    var repos: [GithubRepo]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Initialize the UISearchBar
        searchBar = UISearchBar()
        searchBar.delegate = self

        // Add SearchBar to the NavigationBar
        searchBar.sizeToFit()
        navigationItem.titleView = searchBar
        

        reposTableView.dataSource = self
        reposTableView.delegate = self
        

        reposTableView.estimatedRowHeight = 100
        reposTableView.rowHeight = UITableViewAutomaticDimension

        // Perform the first search when the view controller first loads
        doSearch()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let repos = repos {
            return repos.count
        }
        else {
            print("Repos is nill")
            
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GithubTableCell", for: indexPath) as! ReposTableViewCell
        
        cell.selectionStyle = .none
        
        let repo = repos![indexPath.row]
        
        
        cell.avatarUIImage.setImageWith(URL( string: repo.ownerAvatarURL!)!)
        cell.repoNameLabel.text = repo.name
        cell.ownerLabel.text = repo.ownerHandle
        cell.numForksLabel.text = repo.forks as! String
        cell.numStarsLabel.text = repo.stars as! String
        cell.descLabel.text = repo.repoDescription
        
       return cell
        
    }
    
    // Perform the search.
    fileprivate func doSearch() {

        MBProgressHUD.showAdded(to: self.view, animated: true)

        // Perform request to GitHub API to get the list of repositories
        GithubRepo.fetchRepos(searchSettings, successCallback: { (newRepos) -> Void in

            // Print the returned repositories to the output window
            for repo in newRepos {
                print(repo)
            }
            self.repos = newRepos
            self.reposTableView.reloadData()

            MBProgressHUD.hide(for: self.view, animated: true)
            }, error: { (error) -> Void in
                print(error)
        })
    }
}

// SearchBar methods
extension RepoResultsViewController: UISearchBarDelegate {

    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(true, animated: true)
        return true
    }

    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(false, animated: true)
        return true
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchSettings.searchString = searchBar.text
        searchBar.resignFirstResponder()
        doSearch()
    }
}
