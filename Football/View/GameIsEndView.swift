//
//  GameIsEndView.swift
//  Football
//
//  Created by Александр Андреев on 04.08.2023.
//

import UIKit

class GameIsEndView: UIView {
    
    private let background = UIImageView(image: UIImage(named: Resources.Backgrounds.greenBackground))
    private let ballIsLoose = UIImageView(image: UIImage(named:LocalizationSystem.sharedInstance.getLanguage() == "en" ?  Resources.Text.ballLoseLabel : Resources.Text.ballLoseLabelRU))
    public var playAgainButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: LocalizationSystem.sharedInstance.getLanguage() == "en" ?  Resources.Buttons.playAgainButton : Resources.Buttons.playAgainButtonRU), for: .normal)
        return button
    }()
    
    public var scoreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Resources.Fonts.montserratBold, size: 39)
        label.text = "050"
        label.textColor = .white
        return label
    }()
    
    public var menuButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: LocalizationSystem.sharedInstance.getLanguage() == "en" ?  Resources.Buttons.menuButton: Resources.Buttons.menuButtonRU), for: .normal)
        return button
    }()
    
    public let person = UIImageView(image: UIImage(named: AppDelegate.shared.currentTShirt + AppDelegate.shared.currentShorts + "Left2"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        addSubview(background)
        addSubview(person)
        addSubview(ballIsLoose)
        addSubview(playAgainButton)
        addSubview(menuButton)
        addSubview(scoreLabel)
        
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        person.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(612)
            make.top.equalTo(snp.centerY)
            make.leading.equalToSuperview().offset(110)
        }
        
        ballIsLoose.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(330)
            make.height.equalTo(27)
            make.top.equalToSuperview().offset(60)
        }
        playAgainButton.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(84)
            make.centerY.equalTo(snp.centerY).offset(-20)
            make.leading.equalToSuperview().offset(50)
        }
        
        menuButton.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(60)
            make.top.equalTo(playAgainButton.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(30)
        }
        scoreLabel.snp.makeConstraints { make in
            make.top.equalTo(ballIsLoose.snp.bottom).offset(35)
            make.centerX.equalToSuperview()
        }
        
    }

}
