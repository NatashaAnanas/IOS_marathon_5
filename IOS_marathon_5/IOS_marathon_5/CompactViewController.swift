//
//  CompactViewController.swift
//  IOS_marathon_5
//
//  Created by Наталья Коновалова on 14.02.2024.
//

import UIKit

final class CompactViewController: UIViewController {
    
    private let segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["280pt", "150pt"])
        control.selectedSegmentIndex = 0
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .close)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialState()
    }
    
    private func setupInitialState() {
        addActions()
        addSubviews()
        setupConstraints()
    }
    
    private func addActions() {
        closeButton.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
        segmentedControl.addTarget(self, action: #selector(segmentedControlAction(sender: )), for: .valueChanged)
    }
    
    private func addSubviews() {
        view.addSubview(segmentedControl)
        view.addSubview(closeButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 8),
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            closeButton.centerYAnchor.constraint(equalTo: segmentedControl.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        ])
    }
    
    @objc private func segmentedControlAction(sender: UISegmentedControl) {
        (sender.selectedSegmentIndex == 0)
        ? (preferredContentSize = .init(width: 300, height: 280))
        : (preferredContentSize = .init(width: 300, height: 150))
    }
    
    @objc private func closeButtonAction() {
        dismiss(animated: true)
    }
}
