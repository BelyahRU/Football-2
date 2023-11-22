//
//  SettingsView.swift
//  Football
//
//  Created by Александр Андреев on 01.08.2023.
//

import UIKit

class SettingsView: UIView {
    
    private let background = UIImageView(image: UIImage(named: Resources.Backgrounds.settingsBackground))
    public var backButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: Resources.Buttons.backButton), for: .normal)
        return button
    }()
    
    private let language = UIImageView(image: UIImage(named: LocalizationSystem.sharedInstance.getLanguage() == "en" ?  Resources.Text.languageLabel : Resources.Text.languageLabelRU))
    private let music = UIImageView(image: UIImage(named: LocalizationSystem.sharedInstance.getLanguage() == "en" ?  Resources.Text.musicLabel : Resources.Text.musicLabelRU))
    private let sound = UIImageView(image: UIImage(named: LocalizationSystem.sharedInstance.getLanguage() == "en" ?  Resources.Text.soundLabel : Resources.Text.soundLabelRU))
    
    public var soundSwitch: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Resources.Switches.onSwitch), for: .normal)
        return button
    }()
    public var musicSwitch: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Resources.Switches.onSwitch), for: .normal)
        return button
    }()
    public var languageSwitch: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: LocalizationSystem.sharedInstance.getLanguage() == "en" ?  Resources.Switches.engSwitch: Resources.Switches.ruSwitch), for: .normal)
        return button
    }()
    
    
    private let stackview: UIStackView = {
        let sv = UIStackView()
        sv.spacing = 25
        sv.axis = .vertical
        sv.alignment = .center
        sv.distribution = .fillProportionally
        return sv
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
        addSubview(stackview)
        
        stackview.addArrangedSubview(sound)
        stackview.addArrangedSubview(soundSwitch)
        stackview.addArrangedSubview(music)
        stackview.addArrangedSubview(musicSwitch)
        stackview.addArrangedSubview(language)
        stackview.addArrangedSubview(languageSwitch)
        
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        backButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16/320*UIScreen.main.bounds.width)
            make.top.equalToSuperview().offset(16/320*UIScreen.main.bounds.height)
            make.height.equalTo(26)
            make.width.equalTo(21)
        }
        
        sound.snp.makeConstraints { make in
            make.width.equalTo(68)
            make.height.equalTo(15)
        }
        
        music.snp.makeConstraints { make in
            if LocalizationSystem.sharedInstance.getLanguage() == "en" {
                make.width.equalTo(61)
                make.height.equalTo(15)
            } else {
                make.width.equalTo(70)
                make.height.equalTo(15)
            }
        }
        language.snp.makeConstraints { make in
            if LocalizationSystem.sharedInstance.getLanguage() == "en" {
                make.width.equalTo(105)
                make.height.equalTo(15)
            } else {
                make.width.equalTo(50)
                make.height.equalTo(15)
            }
        }
        
        [soundSwitch, musicSwitch, languageSwitch].forEach {
            $0.snp.makeConstraints { make in
                make.width.equalTo(144)
                make.height.equalTo(56.8)
            }
        }
        stackview.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(109/568*UIScreen.main.bounds.height)
            make.centerX.equalToSuperview()
            make.width.equalTo(soundSwitch)
        }
    }
    
}
