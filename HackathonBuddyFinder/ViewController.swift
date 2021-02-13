//
//  ViewController.swift
//  HackathonBuddyFinder
//
//  Created by kushal on 13/02/21.
//

import UIKit

class ViewController: UIViewController {
    
    var hackName: UILabel!
    var searchField: UISearchBar!
    var projectsView: UITableView!
    
    let reuseIdentifier = "projectCellReuse"
    let cellHeight: CGFloat = 140
    
    let project1 = Project(projectName: "Alpha", projectTrack: "Social Connectivity", projectDescription: "a platform for student developers", technologiesUsed: "iOS, Firebase, Alamofire", commitmentLevel: "High")
    let project2 = Project(projectName: "Beta", projectTrack: "Healthcare", projectDescription: "making healthcase accessable to all", technologiesUsed: "React, Django, Firebase", commitmentLevel: "Medium")
    let project3 = Project(projectName: "Gamma", projectTrack: "Civic Engagement", projectDescription: "uniting people", technologiesUsed: "ML, Android, Firebase", commitmentLevel: "Medium")
    let project4 = Project(projectName: "Zeta", projectTrack: "Education", projectDescription: "making online-education fun", technologiesUsed: "Cloud, Firestore, Figma", commitmentLevel: "Low")
    
    var projects: [Project]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "TreeHacks"
        view.backgroundColor = .white
        
        projects = [project1, project2, project3, project4, project1, project2, project3, project4, project1, project2, project3, project4, project1, project2, project3, project4, project1, project2, project3, project4]
        
        setupViews()
        setupConstraints()
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

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = projectsView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ProjectTableViewCell
        let project = projects[indexPath.row]
        cell.configure(for: project)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}
