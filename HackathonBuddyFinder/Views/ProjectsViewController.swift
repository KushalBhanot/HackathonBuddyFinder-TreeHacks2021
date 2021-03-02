//
//  ProjectsViewController.swift
//  HackathonBuddyFinder
//
//  Created by kushal on 27/02/21.
//

import UIKit

class ProjectsViewController: UIViewController {
    
    var searchController: UISearchController!
    var searching = false
    var searchedProject = [Project]()
    
    var hackName: UILabel!
    var projectsView: UITableView!
    var projectsButton: UIButton!
    var messagesButton: UIButton!
    var profileButton: UIButton!
    
    let reuseIdentifier = "projectCellReuse"
    let cellHeight: CGFloat = 140
    
    let project1 = Project(projectName: "Alpha", projectTrack: "Social Connectivity", projectDescription: "a platform for student developers", technologiesUsed: "iOS, Firebase, Alamofire", commitmentLevel: "High")
    let project2 = Project(projectName: "Beta", projectTrack: "Healthcare", projectDescription: "making healthcase accessable to all", technologiesUsed: "React, Django, Firebase", commitmentLevel: "Medium")
    let project3 = Project(projectName: "Gamma", projectTrack: "Civic Engagement", projectDescription: "uniting people", technologiesUsed: "ML, Android, Firebase", commitmentLevel: "Medium")
    let project4 = Project(projectName: "Zeta", projectTrack: "Education", projectDescription: "making online-education fun", technologiesUsed: "Cloud, Firestore, Figma", commitmentLevel: "Low")
    
    var projects: [Project]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Projects"
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        
        projects = [project1, project2, project3, project4, project1, project2, project3, project4, project1, project2, project3, project4, project1, project2, project3, project4, project1, project2, project3, project4]
        
        setupNavigationController()
        setupViews()
        setupConstraints()
    }
    
    func setupNavigationController() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = .search
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        searchController.searchBar.placeholder = "Search projects..."
    }
    
    @objc func addTapped() {
        let newViewController = AddProjectViewController()
        newViewController.modalPresentationStyle = .fullScreen
        present(newViewController, animated: true, completion: nil)
    }
    
    func setupViews() {
        projectsView = UITableView()
        projectsView.translatesAutoresizingMaskIntoConstraints = false
        projectsView.dataSource = self
        projectsView.delegate = self
        projectsView.register(ProjectTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(projectsView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            projectsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            projectsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            projectsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            projectsView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
}

extension ProjectsViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchedProject.removeAll()
        projectsView.reloadData()
    }
}

extension ProjectsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
        if !searchText.isEmpty {
            searching = true
        } else {
            searching = false
            searchedProject.removeAll()
            for project in projects {
                if project.projectName.lowercased().contains(searchText.lowercased()) {
                    searchedProject.append(project)
                }
            }
        }
        projectsView.reloadData()
    }
}

extension ProjectsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchedProject.count
        } else {
            return projects.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = projectsView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ProjectTableViewCell
        if searching {
            cell.title.text = searchedProject[indexPath.row].projectName
            cell.track.text = searchedProject[indexPath.row].projectTrack
            cell.projectDes.text = searchedProject[indexPath.row].projectDescription
            cell.technologies.text = searchedProject[indexPath.row].technologiesUsed
            cell.commitment.text = searchedProject[indexPath.row].commitmentLevel
        } else {
            let project = projects[indexPath.row]
            cell.configure(for: project)
        }
        return cell
    }
}

extension ProjectsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}
