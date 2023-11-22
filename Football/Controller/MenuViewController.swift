//
//  MenuViewController.swift
//  Football
//
//  Created by Александр Андреев on 01.08.2023.
//

import UIKit

class MenuViewController: UIViewController {

    private let menuView = MenuView()
    private var rulesButton = UIButton()
    private var startButton = UIButton()
    private var settingsButton = UIButton()
    private var storeButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        view.addSubview(menuView)
        menuView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        
        rulesButton = menuView.rulesButton
        rulesButton.addTarget(self, action: #selector(rulesPressed), for: .touchUpInside)
        
        settingsButton = menuView.settingsButton
        settingsButton.addTarget(self, action: #selector(settingsPrssed), for: .touchUpInside)
        
        startButton = menuView.startButton
        startButton.addTarget(self, action: #selector(startPressed), for: .touchUpInside)
        
        storeButton = menuView.storeButton
        storeButton.addTarget(self, action: #selector(storePressed), for: .touchUpInside)
        
    }

}

private extension MenuViewController {
    @objc func storePressed() {
        let vc = StoreViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func startPressed() {
        let vc = GameViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func rulesPressed() {
        let vc = RulesViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func settingsPrssed() {
        let vc = SettingsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
