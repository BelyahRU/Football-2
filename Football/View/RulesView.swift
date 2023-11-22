//
//  RulesView.swift
//  Football
//
//  Created by Александр Андреев on 01.08.2023.
//

import UIKit

class RulesView: UIView {
    
    private let background = UIImageView(image: UIImage(named: LocalizationSystem.sharedInstance.getLanguage() == "en" ? Resources.Backgrounds.rulesBackground : Resources.Backgrounds.rulesBackgroundRU))
    public var backButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: Resources.Buttons.backButton), for: .normal)
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
        addSubview(background)
        addSubview(backButton)
        
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        backButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16/320*UIScreen.main.bounds.width)
            make.top.equalToSuperview().offset(16/320*UIScreen.main.bounds.height)
            make.height.equalTo(26)
            make.width.equalTo(21)
        }
    }
}
