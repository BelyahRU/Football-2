//
//  GameView.swift
//  Football
//
//  Created by Александр Андреев on 04.08.2023.
//

import UIKit

class GameView: UIView {

    private let background = UIImageView(image: UIImage(named: Resources.Backgrounds.greenBackground))
    public var backButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: Resources.Buttons.backButton), for: .normal)
        return button
    }()
    
    public var leftKickButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: LocalizationSystem.sharedInstance.getLanguage() == "en" ?  Resources.Buttons.leftKickButton : Resources.Buttons.leftKickButtonRU), for: .normal)
        return button
    }()
    
    public var rightKickButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: LocalizationSystem.sharedInstance.getLanguage() == "en" ?  Resources.Buttons.rightKickButton: Resources.Buttons.rightKickButtonRU), for: .normal)
        return button
    }()
    
    public var playerImageView = UIImageView(image: UIImage(named: AppDelegate.shared.currentTShirt+AppDelegate.shared.currentShorts+"Left1"))
    
    private let scoreRectange = UIImageView(image: UIImage(named: "scoreRectangle.png"))
    public var scoreLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont(name: "Montserrat-Bold", size: 20)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(background)
        addSubview(backButton)
        addSubview(leftKickButton)
        addSubview(rightKickButton)
        addSubview(playerImageView)
        addSubview(scoreRectange)
        addSubview(scoreLabel)
        
        scoreRectange.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(94)
            make.height.equalTo(37)
            make.top.equalToSuperview().offset(18/320*UIScreen.main.bounds.height)
        }
        scoreLabel.snp.makeConstraints { make in
            make.centerX.equalTo(scoreRectange.snp.centerX)
            make.centerY.equalTo(scoreRectange.snp.centerY)
        }
        
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        backButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16/320*UIScreen.main.bounds.width)
            make.top.equalToSuperview().offset(16/320*UIScreen.main.bounds.height)
            make.height.equalTo(26)
            make.width.equalTo(21)
        }
        
        leftKickButton.snp.makeConstraints { make in
            make.width.equalTo(130)
            make.height.equalTo(51)
            make.bottom.equalToSuperview().inset(50)
            make.leading.equalToSuperview().offset(30)
        }
        rightKickButton.snp.makeConstraints { make in
            make.width.equalTo(130)
            make.height.equalTo(51)
            make.bottom.equalToSuperview().inset(50)
            make.trailing.equalToSuperview().offset(-30)
        }
        playerImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(159)
            make.height.equalTo(325)
            make.centerY.equalToSuperview()
        }
    }
    
}
