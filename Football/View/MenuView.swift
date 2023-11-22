//
//  MenuView.swift
//  Football
//
//  Created by Александр Андреев on 01.08.2023.
//

import UIKit

class MenuView: UIView {
    
    private let background = UIImageView(image: UIImage(named:  Resources.Backgrounds.menuBackgorund))
    
    public var startButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: LocalizationSystem.sharedInstance.getLanguage() == "en" ? Resources.Buttons.startButton: Resources.Buttons.startButtonRU), for: .normal)
        return button
    }()
    public var rulesButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: LocalizationSystem.sharedInstance.getLanguage() == "en" ? Resources.Buttons.rulesButton: Resources.Buttons.rulesButtonRU), for: .normal)
        return button
    }()
    public var settingsButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named:LocalizationSystem.sharedInstance.getLanguage() == "en" ? Resources.Buttons.settingsButton : Resources.Buttons.settingsButtonRU), for: .normal)
        return button
    }()
    public var storeButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named:LocalizationSystem.sharedInstance.getLanguage() == "en" ? Resources.Buttons.storeButton : Resources.Buttons.storeButtonRU), for: .normal)
        return button
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(background)
        addSubview(startButton)
        addSubview(rulesButton)
        addSubview(settingsButton)
        addSubview(storeButton)
        
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        storeButton.snp.makeConstraints { make in
            make.width.equalTo(109/320 * UIScreen.main.bounds.width)
            make.height.equalTo(40/568 * UIScreen.main.bounds.height)
            make.bottom.equalToSuperview().inset(17/568 * UIScreen.main.bounds.height)
            make.trailing.equalToSuperview().inset(43/320 * UIScreen.main.bounds.width)
        }
        
        settingsButton.snp.makeConstraints { make in
            make.width.equalTo(109/320 * UIScreen.main.bounds.width)
            make.height.equalTo(40/568 * UIScreen.main.bounds.height)
            make.bottom.equalTo(storeButton.snp.top).offset(-17/568 * UIScreen.main.bounds.height)
            make.trailing.equalToSuperview().inset(25/320 * UIScreen.main.bounds.width)
        }
        rulesButton.snp.makeConstraints { make in
            make.width.equalTo(109/320 * UIScreen.main.bounds.width)
            make.height.equalTo(40/568 * UIScreen.main.bounds.height)
            make.bottom.equalTo(settingsButton.snp.top).offset(-17/568 * UIScreen.main.bounds.height)
            make.trailing.equalToSuperview().inset(43/320 * UIScreen.main.bounds.width)
        }
        startButton.snp.makeConstraints { make in
            make.width.equalTo(109/320 * UIScreen.main.bounds.width)
            make.height.equalTo(40/568 * UIScreen.main.bounds.height)
            make.bottom.equalTo(rulesButton.snp.top).offset(-17/568 * UIScreen.main.bounds.height)
            make.trailing.equalToSuperview().inset(25/320 * UIScreen.main.bounds.width)
        }
    }
    
    
    
}
