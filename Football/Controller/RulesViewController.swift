//
//  RulesViewController.swift
//  Football
//
//  Created by Александр Андреев on 01.08.2023.
//

import UIKit

class RulesViewController: UIViewController {
    
    private let rulesView = RulesView()
    private var backButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        view.addSubview(rulesView)
        rulesView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        backButton = rulesView.backButton
        backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
    }

}

private extension RulesViewController {
    @objc func backPressed() {
        navigationController?.popViewController(animated: true)
    }
}
