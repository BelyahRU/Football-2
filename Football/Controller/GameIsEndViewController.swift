//
//  GameIsEndViewController.swift
//  Football
//
//  Created by Александр Андреев on 04.08.2023.
//

import UIKit

class GameIsEndViewController: UIViewController {
    
    private let gameisendview = GameIsEndView()
    private var menuButton = UIButton()
    private var playAgainButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    private func configure() {
        view.addSubview(gameisendview)
        gameisendview.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        gameisendview.scoreLabel.text = "\(AppDelegate.shared.scoresInGame)"
        AppDelegate.shared.scoresInGame = 0
        menuButton = gameisendview.menuButton
        playAgainButton = gameisendview.playAgainButton
        
        menuButton.addTarget(self, action: #selector(menuPressed), for: .touchUpInside)
        playAgainButton.addTarget(self, action: #selector(playPressed), for: .touchUpInside)
    }

}

private extension GameIsEndViewController {
    @objc func menuPressed() {
        let vc = MenuViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func playPressed() {
        let vc = GameViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
