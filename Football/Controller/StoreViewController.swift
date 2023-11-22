//
//  StoreViewController.swift
//  Football
//
//  Created by Александр Андреев on 04.08.2023.
//

import UIKit

class StoreViewController: UIViewController {
    
    private let storeView = StoreView()
    private var backButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTargetForItems()
    }
    
    
    private func setupStore() {
        storeView.BlackBall.setImage(UIImage(named: AppDelegate.shared.isBuyBlackBall ? "BlackBallSold" : "BlackBall"), for: .normal)
        storeView.OrangeBall.setImage(UIImage(named: AppDelegate.shared.isBuyOrangeBall ? "OrangeBallSold" : "OrangeBall"), for: .normal)
        storeView.WhiteBall.setImage(UIImage(named: AppDelegate.shared.isBuyWhiteBall ? "WhiteBallSold" : "WhiteBall"), for: .normal)
        storeView.PurpleT.setImage(UIImage(named: AppDelegate.shared.isBuyTShirtPurple ? "PurpleTSold" : "PurpleT"), for: .normal)
        storeView.YellowT.setImage(UIImage(named: AppDelegate.shared.isBuyTShirtYellow ? "YellowTSold" : "YellowT"), for: .normal)
        storeView.BlackT.setImage(UIImage(named: AppDelegate.shared.isBuyTShirtBlack ? "BlackTSold" : "BlackT"), for: .normal)
        storeView.GreenT.setImage(UIImage(named: AppDelegate.shared.isBuyTShirtGreen ? "GreenTSold" : "GreenT"), for: .normal)
        
        storeView.RedT.setImage(UIImage(named: AppDelegate.shared.isBuyTShirtRed ? "RedTSold" : "RedT"), for: .normal)
        storeView.OrangeP.setImage(UIImage(named: AppDelegate.shared.isBuyShortsOrange ? "OrangePSold" : "OrangeP"), for: .normal)
        storeView.BlackP.setImage(UIImage(named: AppDelegate.shared.isBuyShortsBlack ? "BlackPSold" : "BlackP"), for: .normal)
        storeView.LightBlueP.setImage(UIImage(named: AppDelegate.shared.isBuyShortsLightBlue ? "LightBluePSold" : "LightBlueP"), for: .normal)
        storeView.WhiteP.setImage(UIImage(named: AppDelegate.shared.isBuyShortsWhite ? "WhitePSold" : "WhiteP"), for: .normal)
        storeView.BlueP.setImage(UIImage(named: AppDelegate.shared.isBuyShortsBlue ? "BluePSold" : "BlueP"), for: .normal)
    }
    
    private func setupView() {

        view.addSubview(storeView)
        
        storeView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        backButton = storeView.backButton
        backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
    }
    private func setupTargetForItems() {
        
        
        // Футболки
        
        storeView.PurpleT.addTarget(self, action: #selector(TshirtPurple), for: .touchUpInside)
        
        storeView.YellowT.addTarget(self, action: #selector(TshirtYellow), for: .touchUpInside)
        
        storeView.BlackT.addTarget(self, action: #selector(TshirtBlack), for: .touchUpInside)
        
        storeView.GreenT.addTarget(self, action: #selector(TshirtGreen), for: .touchUpInside)
        
        storeView.RedT.addTarget(self, action: #selector(TshirtRed), for: .touchUpInside)
        
        
        // Шорты
        storeView.OrangeP.addTarget(self, action: #selector(shortsOrange), for: .touchUpInside)
        
        storeView.BlackP.addTarget(self, action: #selector(shortsBlack), for: .touchUpInside)
        
        storeView.LightBlueP.addTarget(self, action: #selector(shortsLightBlue), for: .touchUpInside)
        
        storeView.WhiteP.addTarget(self, action: #selector(shortsWhite), for: .touchUpInside)
        
        storeView.BlueP.addTarget(self, action: #selector(shortsBlue), for: .touchUpInside)
        
        
        // Мячи
        
        storeView.BlackBall.addTarget(self, action: #selector(blackBallPressed), for: .touchUpInside)
        storeView.OrangeBall.addTarget(self, action: #selector(orangeBallPressed), for: .touchUpInside)
        storeView.WhiteBall.addTarget(self, action: #selector(whiteBallPressed), for: .touchUpInside)
        
    }
    
    
}
// Balls
private extension StoreViewController {
    @objc func blackBallPressed() {
        if AppDelegate.shared.isBuyBlackBall {
            AppDelegate.shared.currentBall = "BlackBall"
        } else {
            let vc = BuyViewController()
            vc.priceValue = 200
            vc.nameButton = "BlackBall"
            vc.delegate = self
            vc.modalPresentationStyle = .overFullScreen
            vc.modalTransitionStyle = .crossDissolve
            present(vc, animated: true)
        }
    }
    
    @objc func orangeBallPressed() {
        if AppDelegate.shared.isBuyOrangeBall {
            AppDelegate.shared.currentBall = "OrangeBall"
        } else {
            let vc = BuyViewController()
            vc.priceValue = 100
            vc.nameButton = "OrangeBall"
            vc.delegate = self
            vc.modalPresentationStyle = .overFullScreen
            vc.modalTransitionStyle = .crossDissolve
            present(vc, animated: true)
        }
    }
    
    @objc func whiteBallPressed() {
        if AppDelegate.shared.isBuyWhiteBall {
            AppDelegate.shared.currentBall = "WhiteBall"
        } else {
            let vc = BuyViewController()
            vc.priceValue = 500
            vc.nameButton = "WhiteBall"
            vc.delegate = self
            vc.modalPresentationStyle = .overFullScreen
            vc.modalTransitionStyle = .crossDissolve
            present(vc, animated: true)
        }
    }
}



private extension StoreViewController {
    @objc func TshirtPurple() {
        if AppDelegate.shared.isBuyTShirtPurple {
                
            AppDelegate.shared.currentTShirt = "Purple"
            print(AppDelegate.shared.currentTShirt)
            
            storeView.person = UIImageView(image: UIImage(named: AppDelegate.shared.currentTShirt + AppDelegate.shared.currentShorts + "Player.png"))
        } else {
            let vc = BuyViewController()
            vc.priceValue = 30
            vc.nameButton = "PurpleT"
            vc.delegate = self
            vc.modalPresentationStyle = .overFullScreen
            vc.modalTransitionStyle = .crossDissolve
            present(vc, animated: true)
        }
        
    }
    @objc func TshirtYellow() {
        if AppDelegate.shared.isBuyTShirtYellow {
                AppDelegate.shared.currentTShirt = "Yellow"
            
                storeView.person.image = UIImage(named: AppDelegate.shared.currentTShirt + AppDelegate.shared.currentShorts + "Player.png")
            print(AppDelegate.shared.currentTShirt)
        } else {
            let vc = BuyViewController()
            vc.priceValue = 60
            vc.nameButton = "YellowT"
            vc.delegate = self
            vc.modalPresentationStyle = .overFullScreen
            vc.modalTransitionStyle = .crossDissolve
            present(vc, animated: true)
        }
    }
    @objc func TshirtBlack() {
        if AppDelegate.shared.isBuyTShirtBlack {
                AppDelegate.shared.currentTShirt = "Black"
                storeView.person.image = UIImage(named: AppDelegate.shared.currentTShirt + AppDelegate.shared.currentShorts + "Player.png")
            print(AppDelegate.shared.currentTShirt)
        } else {
            let vc = BuyViewController()
            vc.priceValue = 90
            vc.nameButton = "BlackT"
            vc.delegate = self
            vc.modalPresentationStyle = .overFullScreen
            vc.modalTransitionStyle = .crossDissolve
            present(vc, animated: true)
        }
    }
    @objc func TshirtGreen() {
        if AppDelegate.shared.isBuyTShirtGreen {
                AppDelegate.shared.currentTShirt = "Green"
            
                storeView.person.image = UIImage(named: AppDelegate.shared.currentTShirt + AppDelegate.shared.currentShorts + "Player.png")
        } else {
            let vc = BuyViewController()
            vc.priceValue = 120
            vc.nameButton = "GreenT"
            vc.delegate = self
            vc.modalPresentationStyle = .overFullScreen
            vc.modalTransitionStyle = .crossDissolve
            present(vc, animated: true)
        }
    }
    @objc func TshirtRed() {
        if AppDelegate.shared.isBuyTShirtRed {
                AppDelegate.shared.currentTShirt = "Red"
            
                storeView.person.image = UIImage(named: AppDelegate.shared.currentTShirt + AppDelegate.shared.currentShorts + "Player.png")
        } else {
            let vc = BuyViewController()
            vc.priceValue = 150
            vc.nameButton = "RedT"
            vc.delegate = self
            vc.modalPresentationStyle = .overFullScreen
            vc.modalTransitionStyle = .crossDissolve
            present(vc, animated: true)
        }
    }
    @objc func shortsOrange() {
        if AppDelegate.shared.isBuyShortsOrange {
                AppDelegate.shared.currentShorts = "Orange"
            
                storeView.person.image = UIImage(named: AppDelegate.shared.currentTShirt + AppDelegate.shared.currentShorts + "Player.png")
        } else {
            let vc = BuyViewController()
            vc.priceValue = 30
            vc.nameButton = "OrangeP"
            vc.delegate = self
            vc.modalPresentationStyle = .overFullScreen
            vc.modalTransitionStyle = .crossDissolve
            present(vc, animated: true)
        }
    }
    
    
    @objc func shortsBlack() {
        if AppDelegate.shared.isBuyShortsBlack {
                AppDelegate.shared.currentShorts = "Black"
            
                storeView.person.image = UIImage(named: AppDelegate.shared.currentTShirt + AppDelegate.shared.currentShorts + "Player.png")
        } else {
            let vc = BuyViewController()
            vc.priceValue = 60
            vc.nameButton = "BlackP"
            vc.delegate = self
            vc.modalPresentationStyle = .overFullScreen
            vc.modalTransitionStyle = .crossDissolve
            present(vc, animated: true)
        }
    }
    @objc func shortsLightBlue() {
        if AppDelegate.shared.isBuyShortsLightBlue {
            AppDelegate.shared.currentShorts = "LightBlue"
            
            storeView.person.image = UIImage(named: AppDelegate.shared.currentTShirt + AppDelegate.shared.currentShorts + "Player.png")
        } else {
            let vc = BuyViewController()
            vc.priceValue = 90
            vc.nameButton = "LightBlueP"
            vc.delegate = self
            vc.modalPresentationStyle = .overFullScreen
            vc.modalTransitionStyle = .crossDissolve
            present(vc, animated: true)
        }
    }
    @objc func shortsWhite() {
        if AppDelegate.shared.isBuyShortsWhite {
            AppDelegate.shared.currentShorts = "White"
            
            storeView.person.image = UIImage(named: AppDelegate.shared.currentTShirt + AppDelegate.shared.currentShorts + "Player.png")
        } else {
            let vc = BuyViewController()
            vc.priceValue = 120
            vc.nameButton = "WhiteP"
            vc.delegate = self
            vc.modalPresentationStyle = .overFullScreen
            vc.modalTransitionStyle = .crossDissolve
            present(vc, animated: true)
        }
    }
    @objc func shortsBlue() {
        if AppDelegate.shared.isBuyShortsBlue {
            AppDelegate.shared.currentShorts = "Blue"
            
            storeView.person.image = UIImage(named: AppDelegate.shared.currentTShirt + AppDelegate.shared.currentShorts + "Player.png")
        } else {
            let vc = BuyViewController()
            vc.priceValue = 150
            vc.nameButton = "BlueP"
            vc.delegate = self
            vc.modalPresentationStyle = .overFullScreen
            vc.modalTransitionStyle = .crossDissolve
            present(vc, animated: true)
        }
    }
}

extension StoreViewController: BuyViewControllerDelegate {
    func didBuyIt() {
        print(AppDelegate.shared.currentTShirt + AppDelegate.shared.currentShorts + "Player.png")
        
        storeView.person.image = UIImage(named: AppDelegate.shared.currentTShirt + AppDelegate.shared.currentShorts + "Player.png")
        setupStore()
    }
}

extension StoreViewController {

    @objc func backPressed() {
        navigationController?.popViewController(animated: true)
        
    }
}
