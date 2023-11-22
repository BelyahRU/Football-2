//
//  StoreView.swift
//  Football
//
//  Created by Александр Андреев on 04.08.2023.
//

import UIKit

class StoreView: UIView {
    
    private let background = UIImageView(image: UIImage(named: Resources.Backgrounds.storeBackground))
    
    //t-shirts
    public let PurpleT: UIButton = {
        let button = UIButton()
        if AppDelegate.shared.isBuyTShirtGreen == true {
            button.setImage(UIImage(named: "PurpleTSold.png"), for: .normal)
        } else {
            button.setImage(UIImage(named: "PurpleT.png"), for: .normal)
        }
        return button
    }()
    
    public let BlackT: UIButton = {
        let button = UIButton()
        if AppDelegate.shared.isBuyTShirtBlack == true {
            button.setImage(UIImage(named: "BlackTSold.png"), for: .normal)
        } else {
            button.setImage(UIImage(named: "BlackT.png"), for: .normal)
        }
        return button
    }()
    public let RedT: UIButton = {
        let button = UIButton()
        if AppDelegate.shared.isBuyTShirtRed == true {
            button.setImage(UIImage(named: "RedTSold.png"), for: .normal)
        } else {
            button.setImage(UIImage(named: "RedT.png"), for: .normal)
        }
        return button
    }()
    public let YellowT: UIButton = {
        let button = UIButton()
        if AppDelegate.shared.isBuyTShirtYellow == true {
            button.setImage(UIImage(named: "YellowTSold.png"), for: .normal)
        } else {
            button.setImage(UIImage(named: "YellowT.png"), for: .normal)
        }
        return button
    }()
    public let GreenT: UIButton = {
        let button = UIButton()
        if AppDelegate.shared.isBuyTShirtGreen == true {
            button.setImage(UIImage(named: "GreenTSold.png"), for: .normal)
        } else {
            button.setImage(UIImage(named: "GreenT.png"), for: .normal)
        }
        return button
    }()
    
    
    
    
    //pants
    public let OrangeP: UIButton = {
        let button = UIButton()
        if AppDelegate.shared.isBuyShortsOrange == true {
            button.setImage(UIImage(named: "OrangePSold.png"), for: .normal)
        } else {
            button.setImage(UIImage(named: "OrangeP.png"), for: .normal)
        }
        return button
    }()
    public let BlackP: UIButton = {
        let button = UIButton()
        if AppDelegate.shared.isBuyShortsBlack == true {
            button.setImage(UIImage(named: "BlackPSold.png"), for: .normal)
        } else {
            button.setImage(UIImage(named: "BlackP.png"), for: .normal)
        }
        return button
    }()
    public let LightBlueP: UIButton = {
        let button = UIButton()
        if AppDelegate.shared.isBuyShortsLightBlue == true {
            button.setImage(UIImage(named: "LightBluePSold.png"), for: .normal)
        } else {
            button.setImage(UIImage(named: "LightBlueP.png"), for: .normal)
        }
        return button
    }()
    public let WhiteP: UIButton = {
        let button = UIButton()
        if AppDelegate.shared.isBuyShortsWhite == true {
            button.setImage(UIImage(named: "WhitePSold.png"), for: .normal)
        } else {
            button.setImage(UIImage(named: "WhiteP.png"), for: .normal)
        }
        return button
    }()
    public let BlueP: UIButton = {
        let button = UIButton()
        if AppDelegate.shared.isBuyShortsBlue == true {
            button.setImage(UIImage(named: "BluePSold.png"), for: .normal)
        } else {
            button.setImage(UIImage(named: "BlueP.png"), for: .normal)
        }
        return button
    }()
    
    
    //Balls
    public let WhiteBall: UIButton = {
        let button = UIButton()
        if AppDelegate.shared.isBuyWhiteBall == true {
            button.setImage(UIImage(named: "WhiteBallSold.png"), for: .normal)
        } else {
            button.setImage(UIImage(named: "WhiteBall.png"), for: .normal)
        }
        return button
    }()
    public let OrangeBall: UIButton = {
        let button = UIButton()
        if AppDelegate.shared.isBuyOrangeBall == true {
            button.setImage(UIImage(named: "OrangeBallSold.png"), for: .normal)
        } else {
            button.setImage(UIImage(named: "OrangeBall.png"), for: .normal)
        }
        return button
    }()
    public let BlackBall: UIButton = {
        let button = UIButton()
        if AppDelegate.shared.isBuyBlackBall == true {
            button.setImage(UIImage(named: "BlackBallSold.png"), for: .normal)
        } else {
            button.setImage(UIImage(named: "BlackBall.png"), for: .normal)
        }
        return button
    }()
    
    public let backButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: Resources.Buttons.backButton), for: .normal)
        return button
    }()
    
    
    //игрок
//    public var person = UIImageView(image: UIImage(named: "LightGreenGrayPerson.png"))
    public var person = UIImageView(image: UIImage(named: AppDelegate.shared.currentTShirt + AppDelegate.shared.currentShorts + "Player.png"))


    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(background)
        addSubview(PurpleT)
        addSubview(YellowT)
        addSubview(BlackT)
        addSubview(GreenT)
        addSubview(RedT)
        
        addSubview(OrangeP)
        addSubview(BlackP)
        addSubview(LightBlueP)
        addSubview(WhiteP)
        addSubview(BlueP)
        
        addSubview(OrangeBall)
        addSubview(WhiteBall)
        addSubview(BlackBall)
        
        addSubview(person)
        addSubview(backButton)
        
        
        backButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16/320*UIScreen.main.bounds.width)
            make.top.equalToSuperview().offset(16/320*UIScreen.main.bounds.height)
            make.height.equalTo(26)
            make.width.equalTo(21)
        }
        
        
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        [PurpleT, YellowT, BlackT, RedT, GreenT].forEach {
            $0.snp.makeConstraints { make in
                make.width.equalTo(86)
                make.height.equalTo(100)
            }
        }
        
        PurpleT.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(150)
            make.leading.equalToSuperview().offset(16)
        }
        YellowT.snp.makeConstraints { make in
            make.top.equalTo(PurpleT.snp.centerY)
            make.leading.equalTo(PurpleT.snp.centerX)
        }
        BlackT.snp.makeConstraints { make in
            make.top.equalTo(PurpleT.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(16)
        }
        RedT.snp.makeConstraints { make in
            make.top.equalTo(BlackT.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(16)
        }
        GreenT.snp.makeConstraints { make in
            make.top.equalTo(BlackT.snp.centerY)
            make.leading.equalTo(BlackT.snp.centerX)
        }
        
        [OrangeP, BlackP, LightBlueP, WhiteP, BlueP].forEach {
            $0.snp.makeConstraints { make in
                make.width.equalTo(69)
                make.height.equalTo(80)
            }
        }
        
        [WhiteBall, OrangeBall, BlackBall].forEach {
            $0.snp.makeConstraints { make in
                make.width.equalTo(59)
                make.height.equalTo(85)
            }
        }
        
        
        WhiteBall.snp.makeConstraints { make in
            make.trailing.equalTo(BlueP.snp.leading)
            make.bottom.equalToSuperview().offset(-20)
        }
        
        BlackBall.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-15)
            make.leading.equalTo(RedT.snp.leading)
        }
        
        OrangeBall.snp.makeConstraints { make in
            make.trailing.equalTo(GreenT.snp.centerX).offset(10)
            make.bottom.equalTo(WhiteBall.snp.top).offset(10)
        }
        
        OrangeP.snp.makeConstraints { make in
            make.top.equalTo(YellowT.snp.top).offset(-15)
            make.leading.equalTo(YellowT.snp.trailing).offset(13)
        }
        BlackP.snp.makeConstraints { make in
            make.top.equalTo(OrangeP.snp.bottom).offset(-15)
            make.leading.equalTo(OrangeP.snp.centerX)
        }
        LightBlueP.snp.makeConstraints { make in
            make.top.equalTo(GreenT.snp.top).offset(-15)
            make.leading.equalTo(GreenT.snp.trailing).offset(13)
        }
        WhiteP.snp.makeConstraints { make in
            make.top.equalTo(LightBlueP.snp.centerY).offset(-4)
            make.leading.equalTo(LightBlueP.snp.centerX)
        }
        BlueP.snp.makeConstraints { make in
            make.top.equalTo(WhiteP.snp.centerY)
            make.leading.equalTo(OrangeP.snp.leading)
            
        }
        
        person.snp.makeConstraints { make in
            make.leading.equalTo(WhiteP.snp.trailing).offset(5)
            make.width.equalTo(86)
            make.height.equalTo(300)
            make.bottom.equalToSuperview().inset(85)
        }
        
    }
    
}
