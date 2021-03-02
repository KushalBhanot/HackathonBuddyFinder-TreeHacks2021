//
//  Project.swift
//  HackathonBuddyFinder
//
//  Created by kushal on 13/02/21.
//

import Foundation

class Project {
    var projectName: String
    var projectTrack: String
    var projectDescription: String
    var technologiesUsed: String
    var commitmentLevel: String
    
    init(projectName: String, projectTrack: String, projectDescription: String, technologiesUsed: String, commitmentLevel: String) {
        self.projectName = projectName
        self.projectTrack = projectTrack
        self.projectDescription = projectDescription
        self.technologiesUsed = technologiesUsed
        self.commitmentLevel = commitmentLevel
    }
}
