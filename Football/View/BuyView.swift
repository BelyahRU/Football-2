//
//  BuyView.swift
//  Football
//
//  Created by Александр Андреев on 05.08.2023.
//

import UIKit

class BuyView: UIView {
    
    public var price = UIImageView(image: UIImage(named: "30.png"))
    
    
    public let buyView = UIImageView(image: UIImage(named: "BuyWindow.png"))
    
    public let tickButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "tickButton.png"), for: .normal)
        return button
    }()
    
    public let crossButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "crossButton.png"), for: .normal)
        return button
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(buyView)
        addSubview(crossButton)
        addSubview(tickButton)
        buyView.addSubview(price)
        buyView.snp.makeConstraints { make in
            make.width.equalTo(220)
            make.height.equalTo(134)
            make.centerX.centerY.equalToSuperview()
        }
        
        crossButton.snp.makeConstraints { make in
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.bottom.equalTo(buyView.snp.bottom).inset(20)
            make.trailing.equalTo(buyView.snp.trailing).offset(-30)
        }
        tickButton.snp.makeConstraints { make in
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.bottom.equalTo(buyView.snp.bottom).inset(20)
            make.leading.equalTo(buyView.snp.leading).offset(30)
        }
        price.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalTo(50)
            make.height.equalTo(25)
        }
        
    }
    
}
