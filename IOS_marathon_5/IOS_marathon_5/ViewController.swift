//
//  ViewController.swift
//  IOS_marathon_5
//
//  Created by Наталья Коновалова on 14.02.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    private let presentButton: UIButton = {
        let button = UIButton()
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.title = "Present"
        button.configuration = buttonConfiguration
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
        presentButton.addTarget(self, action: #selector(presentButtonAction), for: .touchUpInside)
    }
    
    private func addSubviews() {
        view.backgroundColor = .white
        view.addSubview(presentButton)
    }
    
    private func setupCompactViewSettings(viewController: UIViewController) {
        viewController.preferredContentSize = CGSize(width: 300, height: 280)
        viewController.modalPresentationStyle = .popover
        viewController.popoverPresentationController?.delegate = self
        viewController.popoverPresentationController?.sourceView = presentButton
        viewController.popoverPresentationController?.sourceRect = presentButton.bounds
        viewController.popoverPresentationController?.permittedArrowDirections = .up
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            presentButton.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc private func presentButtonAction() {
        let compactViewController = CompactViewController()
        setupCompactViewSettings(viewController: compactViewController)
        navigationController?.present(compactViewController, animated: true)
    }
}

extension ViewController: UIPopoverPresentationControllerDelegate {
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}
