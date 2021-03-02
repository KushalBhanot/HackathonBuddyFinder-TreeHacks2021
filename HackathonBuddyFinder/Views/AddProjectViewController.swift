//
//  AddProjectViewController.swift
//  HackathonBuddyFinder
//
//  Created by kushal on 14/02/21.
//

import UIKit

class AddProjectViewController: UIViewController {
    //MARK:- Add scroll functionality for landscape modes(Embed everything in a ScrollView)
    
    var dismissModalButton: UIButton!
    
    var projectName: UILabel!
    var projectNameInput: UITextField!
    
    var projectTrack: UILabel!
    var projectTrackInput: UITextField!
    
    var projectDescription: UILabel!
    var projectDescriptionInput: UITextField!
    
    var technologiesUsed: UILabel!
    var technologiesUsedInput: UITextField!
    
    var commitmentLevel: UILabel!
    var commitmentLevelInput: UITextField!
    
    var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        dismissModalButton = UIButton()
        dismissModalButton.translatesAutoresizingMaskIntoConstraints = false
        dismissModalButton.layer.cornerRadius = 12
        dismissModalButton.setTitle("Dismiss", for: .normal)
        dismissModalButton.setTitleColor(.systemRed, for: .normal)
        dismissModalButton.backgroundColor = .white
        dismissModalButton.addTarget(self, action: #selector(didTapDismiss), for: .touchUpInside)
        view.addSubview(dismissModalButton)
        
        projectName = UILabel()
        projectName.translatesAutoresizingMaskIntoConstraints = false
        projectName.text = "Project Name: "
        projectName.textColor = .black
        projectName.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        projectName.alpha = 0.8
        view.addSubview(projectName)
        
        projectNameInput = UITextField()
        projectNameInput.translatesAutoresizingMaskIntoConstraints = false
        projectNameInput.borderStyle = .roundedRect
        projectNameInput.layer.borderWidth = 0.5
        projectNameInput.layer.borderColor = UIColor.lightGray.cgColor
        projectNameInput.placeholder = "Enter project name..."
        view.addSubview(projectNameInput)
        
        projectTrack = UILabel()
        projectTrack.translatesAutoresizingMaskIntoConstraints = false
        projectTrack.text = "Project Track: "
        projectTrack.textColor = .black
        projectTrack.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        projectTrack.alpha = 0.8
        view.addSubview(projectTrack)
        
        projectTrackInput = UITextField()
        projectTrackInput.translatesAutoresizingMaskIntoConstraints = false
        projectTrackInput.borderStyle = .roundedRect
        projectTrackInput.layer.borderWidth = 0.5
        projectTrackInput.layer.borderColor = UIColor.lightGray.cgColor
        projectTrackInput.placeholder = "Enter project's track..."
        view.addSubview(projectTrackInput)
        
        projectDescription = UILabel()
        projectDescription.translatesAutoresizingMaskIntoConstraints = false
        projectDescription.text = "Project Description: "
        projectDescription.textColor = .black
        projectDescription.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        projectDescription.alpha = 0.8
        view.addSubview(projectDescription)
        
        projectDescriptionInput = UITextField()
        projectDescriptionInput.translatesAutoresizingMaskIntoConstraints = false
        projectDescriptionInput.borderStyle = .roundedRect
        projectDescriptionInput.layer.borderWidth = 0.5
        projectDescriptionInput.layer.borderColor = UIColor.lightGray.cgColor
        projectDescriptionInput.placeholder = "Enter project's description..."
        view.addSubview(projectDescriptionInput)
        
        technologiesUsed = UILabel()
        technologiesUsed.translatesAutoresizingMaskIntoConstraints = false
        technologiesUsed.text = "Technologies Used: "
        technologiesUsed.textColor = .black
        technologiesUsed.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        technologiesUsed.alpha = 0.8
        view.addSubview(technologiesUsed)
        
        technologiesUsedInput = UITextField()
        technologiesUsedInput.translatesAutoresizingMaskIntoConstraints = false
        technologiesUsedInput.borderStyle = .roundedRect
        technologiesUsedInput.layer.borderWidth = 0.5
        technologiesUsedInput.layer.borderColor = UIColor.lightGray.cgColor
        technologiesUsedInput.placeholder = "Enter technologies used..."
        view.addSubview(technologiesUsedInput)
        
        commitmentLevel = UILabel()
        commitmentLevel.translatesAutoresizingMaskIntoConstraints = false
        commitmentLevel.text = "Commitment Level: "
        commitmentLevel.textColor = .black
        commitmentLevel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        commitmentLevel.alpha = 0.8
        view.addSubview(commitmentLevel)
        
        commitmentLevelInput = UITextField()
        commitmentLevelInput.translatesAutoresizingMaskIntoConstraints = false
        commitmentLevelInput.borderStyle = .roundedRect
        commitmentLevelInput.layer.borderWidth = 0.5
        commitmentLevelInput.layer.borderColor = UIColor.lightGray.cgColor
        commitmentLevelInput.placeholder = "Enter commitment level.."
        view.addSubview(commitmentLevelInput)
        
        addButton = UIButton()
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.layer.cornerRadius = 12
        addButton.setTitle("Save", for: .normal)
        addButton.setTitleColor(.white, for: .normal)
        addButton.backgroundColor = .link
        addButton.addTarget(self, action: #selector(didTapSave), for: .touchUpInside)
        view.addSubview(addButton)
    }
    
    @objc func didTapDismiss() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func didTapSave() {
       print("Added a new cell to a table view")
    }
    
    override func viewDidLayoutSubviews() {
        dismissModalButton.frame = CGRect(x: projectName.right+80, y: projectName.top, width: 200, height: 40)
        addButton.frame = CGRect(x: 20, y: commitmentLevelInput.bottom+40, width: view.width-180, height: 52)
    }
    
    func setupConstraints() {
        let padding: CGFloat = 20
        let inputFieldTopPadding: CGFloat = 5
        
        NSLayoutConstraint.activate([
            projectName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            projectName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            projectName.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            projectNameInput.leadingAnchor.constraint(equalTo: projectName.leadingAnchor),
            projectNameInput.topAnchor.constraint(equalTo: projectName.bottomAnchor, constant: inputFieldTopPadding),
            projectNameInput.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            projectTrack.topAnchor.constraint(equalTo: projectNameInput.bottomAnchor, constant: 10),
            projectTrack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            projectTrack.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            projectTrackInput.leadingAnchor.constraint(equalTo: projectTrack.leadingAnchor),
            projectTrackInput.topAnchor.constraint(equalTo: projectTrack.bottomAnchor, constant: inputFieldTopPadding),
            projectTrackInput.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            projectDescription.topAnchor.constraint(equalTo: projectTrackInput.bottomAnchor, constant: 10),
            projectDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            projectDescription.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            projectDescriptionInput.leadingAnchor.constraint(equalTo: projectDescription.leadingAnchor),
            projectDescriptionInput.topAnchor.constraint(equalTo: projectDescription.bottomAnchor, constant: inputFieldTopPadding),
            projectDescriptionInput.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            technologiesUsed.topAnchor.constraint(equalTo: projectDescriptionInput.bottomAnchor, constant: 10),
            technologiesUsed.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            technologiesUsed.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            technologiesUsedInput.leadingAnchor.constraint(equalTo: technologiesUsed.leadingAnchor),
            technologiesUsedInput.topAnchor.constraint(equalTo: technologiesUsed.bottomAnchor, constant: inputFieldTopPadding),
            technologiesUsedInput.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            commitmentLevel.topAnchor.constraint(equalTo: technologiesUsedInput.bottomAnchor, constant: 10),
            commitmentLevel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            commitmentLevel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            commitmentLevelInput.topAnchor.constraint(equalTo: commitmentLevel.bottomAnchor, constant: inputFieldTopPadding),
            commitmentLevelInput.leadingAnchor.constraint(equalTo: commitmentLevel.leadingAnchor),
            commitmentLevelInput.heightAnchor.constraint(equalToConstant: 40)
        ])
        
//        NSLayoutConstraint.activate([
//            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
//            addButton.topAnchor.constraint(equalTo: commitmentLevelInput.bottomAnchor, constant: 20),
//            addButton.heightAnchor.constraint(equalToConstant: 40)
//        ])
    }
}
