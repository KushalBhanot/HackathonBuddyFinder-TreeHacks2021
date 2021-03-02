//
//  ProjectTableViewCell.swift
//  HackathonBuddyFinder
//
//  Created by kushal on 13/02/21.
//

import UIKit

class ProjectTableViewCell: UITableViewCell {
    
    var title: UILabel!
    var track: UILabel!
    var projectDes: UILabel!
    
    var techLabel: UILabel!
    var technologies: UILabel!
    
    var commitmentLabel: UILabel!
    var commitment: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        backgroundColor = .white
        
        title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .black
        title.font = .systemFont(ofSize: 16, weight: .bold)
        contentView.addSubview(title)
        
        track = UILabel()
        track.translatesAutoresizingMaskIntoConstraints = false
        track.textColor = .black
        track.alpha = 0.7
        track.font = .italicSystemFont(ofSize: 12)
        contentView.addSubview(track)
        
        projectDes = UILabel()
        projectDes.translatesAutoresizingMaskIntoConstraints = false
        projectDes.textColor = .black
        projectDes.font = .systemFont(ofSize: 12, weight: .regular)
        projectDes.alpha = 0.7
        contentView.addSubview(projectDes)
        
        techLabel = UILabel()
        techLabel.text = "Tools/technologies"
        techLabel.translatesAutoresizingMaskIntoConstraints = false
        techLabel.textColor = .black
        techLabel.font = .italicSystemFont(ofSize: 12)
        techLabel.alpha = 0.5
        contentView.addSubview(techLabel)
        
        technologies = UILabel()
        technologies.translatesAutoresizingMaskIntoConstraints = false
        technologies.textColor = .black
        technologies.alpha = 0.7
        technologies.font = .systemFont(ofSize: 12, weight: .semibold)
        contentView.addSubview(technologies)
        
        commitmentLabel = UILabel()
        commitmentLabel.text = "Commitment"
        commitmentLabel.translatesAutoresizingMaskIntoConstraints = false
        commitmentLabel.textColor = .black
        commitmentLabel.font = .italicSystemFont(ofSize: 12)
        commitmentLabel.alpha = 0.5
        contentView.addSubview(commitmentLabel)
        
        commitment = UILabel()
        commitment.translatesAutoresizingMaskIntoConstraints = false
        commitment.textColor = .black
        commitment.alpha = 0.7
        commitment.font = .systemFont(ofSize: 12, weight: .semibold)
        contentView.addSubview(commitment)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            title.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            track.leadingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 44),
            track.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            track.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            projectDes.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            projectDes.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8),
            projectDes.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            techLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            techLabel.topAnchor.constraint(equalTo: projectDes.bottomAnchor, constant: 12),
            techLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            commitmentLabel.leadingAnchor.constraint(equalTo: track.leadingAnchor),
            commitmentLabel.topAnchor.constraint(equalTo: projectDes.bottomAnchor, constant: 12),
            commitmentLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            technologies.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            technologies.topAnchor.constraint(equalTo: techLabel.bottomAnchor, constant: 2),
            technologies.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            commitment.leadingAnchor.constraint(equalTo: commitmentLabel.leadingAnchor),
            commitment.topAnchor.constraint(equalTo: commitmentLabel.bottomAnchor, constant: 2),
            commitment.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func configure(for project: Project) {
        title.text = project.projectName
        track.text = project.projectTrack
        projectDes.text = project.projectDescription
        technologies.text = project.technologiesUsed
        commitment.text = project.commitmentLevel
    }
}
