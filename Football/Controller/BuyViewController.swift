//
//  BuyViewController.swift
//  Football
//
//  Created by Александр Андреев on 05.08.2023.
//

import UIKit
protocol BuyViewControllerDelegate: AnyObject {
    func didBuyIt()
}

class BuyViewController: UIViewController {
    
    private var popUpWindowView = BuyView()
    weak var delegate: BuyViewControllerDelegate?
    
    private var cross = UIButton()
    private var tick = UIButton()
    private var price = UIImageView()
    
    public var priceValue = 0
    public var nameButton = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        price = popUpWindowView.price
        currentPriceImage()
        view.addSubview(popUpWindowView)
        view.backgroundColor = .clear
        popUpWindowView.backgroundColor = .clear
        popUpWindowView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        cross = popUpWindowView.crossButton
        tick = popUpWindowView.tickButton
        
        cross.addTarget(self, action: #selector(crossPressed), for: .touchUpInside)
        tick.addTarget(self, action: #selector(tickPressed), for: .touchUpInside)
    }
    
    private func currentPriceImage() {
        switch priceValue {
        case 200:
            price.image = UIImage(named: "200")
        case 60:
            price.image = UIImage(named: "60")
        case 90:
            price.image = UIImage(named: "90")
        case 100:
            price.image = UIImage(named: "100")
        case 120:
            price.image = UIImage(named: "120")
        case 150:
            price.image = UIImage(named: "150")
        case 500:
            price.image = UIImage(named: "500")
        case 30:
            price.image = UIImage(named: "30")
            
        default:
            popUpWindowView.price = UIImageView(image: UIImage(named: "0"))
        }
    }
}

extension BuyViewController {
    @objc func tickPressed() {
        if AppDelegate.shared.scores >= priceValue {
            AppDelegate.shared.scores -= priceValue
            switch nameButton {
            case "BlackBall":
                AppDelegate.shared.currentBall = "BlackBall"
                AppDelegate.shared.isBuyBlackBall = true
            case "OrangeBall":
                AppDelegate.shared.currentBall = "OrangeBall"
                AppDelegate.shared.isBuyOrangeBall = true
            case "WhiteBall" :
                AppDelegate.shared.currentBall = "WhiteBall"
                AppDelegate.shared.isBuyWhiteBall = true
                
            case "BlackP" :
                AppDelegate.shared.currentShorts = "Black"
                AppDelegate.shared.isBuyShortsBlack = true
            case "BlackT" :
                AppDelegate.shared.currentTShirt = "Black"
                AppDelegate.shared.isBuyTShirtBlack = true
            case "BlueP" :
                AppDelegate.shared.currentShorts = "Blue"
                AppDelegate.shared.isBuyShortsBlue = true
            case "GreenT" :
                AppDelegate.shared.currentTShirt = "Green"
                AppDelegate.shared.isBuyTShirtGreen = true
            case "LightBlueP" :
                AppDelegate.shared.currentShorts = "LightBlue"
                AppDelegate.shared.isBuyShortsLightBlue = true
            case "OrangeP" :
                AppDelegate.shared.currentShorts = "Orange"
                AppDelegate.shared.isBuyShortsOrange = true
            case "PurpleT" :
                AppDelegate.shared.currentTShirt = "Purple"
                AppDelegate.shared.isBuyTShirtPurple = true
            case "RedT" :
                AppDelegate.shared.currentTShirt = "Red"
                AppDelegate.shared.isBuyTShirtRed = true
            case "WhiteP" :
                AppDelegate.shared.currentShorts = "White"
                AppDelegate.shared.isBuyShortsWhite = true
            case "YellowT" :
                AppDelegate.shared.currentTShirt = "Yellow"
                AppDelegate.shared.isBuyTShirtYellow = true
            default:
                print("228acab")
            }
        }
        
        delegate?.didBuyIt()
        dismiss(animated: true)
    }
    
    @objc func crossPressed() {
        dismiss(animated: true)
    }
}
