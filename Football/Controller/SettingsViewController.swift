//
//  SettingsViewController.swift
//  Football
//
//  Created by Александр Андреев on 02.08.2023.
//

import UIKit

class SettingsViewController: UIViewController {
    
    private let settingsView = SettingsView()
    private var backButton = UIButton()
    private var language = UIButton()
    private var music = UIButton()
    private var sound = UIButton()

    

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    private func configure() {
        view.addSubview(settingsView)
        settingsView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        backButton = settingsView.backButton
        backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
        language = settingsView.languageSwitch
        music = settingsView.musicSwitch
        sound = settingsView.soundSwitch
        
        language.addTarget(self, action: #selector(languagePressed), for: .touchUpInside)
        music.addTarget(self, action: #selector(musicPressed), for: .touchUpInside)
        sound.addTarget(self, action: #selector(soundPressed), for: .touchUpInside)
    }
}

private extension SettingsViewController {
    @objc func soundPressed() {
        if sound.currentImage == UIImage(named: Resources.Switches.onSwitch) {
            sound.setImage(UIImage(named: Resources.Switches.offSwitch), for: .normal)
        } else {
            sound.setImage(UIImage(named: Resources.Switches.onSwitch), for: .normal)
        }
    }
    
    @objc func musicPressed() {
        if music.currentImage == UIImage(named: Resources.Switches.onSwitch) {
            music.setImage(UIImage(named: Resources.Switches.offSwitch), for: .normal)
        } else {
            music.setImage(UIImage(named: Resources.Switches.onSwitch), for: .normal)
        }
    }
    
    @objc func languagePressed() {
        if language.currentImage == UIImage(named: Resources.Switches.engSwitch) {
            language.setImage(UIImage(named: Resources.Switches.ruSwitch), for: .normal)
            LocalizationSystem.sharedInstance.setLanguage(languageCode: "ru")
            restartApp()
        } else {
            language.setImage(UIImage(named: Resources.Switches.engSwitch), for: .normal)
            LocalizationSystem.sharedInstance.setLanguage(languageCode: "en")
            restartApp()
        }
    }
    @objc func backPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    private func restartApp() {
        let alert = UIAlertController(title: nil, message: LocalizationSystem.sharedInstance.getLanguage() == "en" ? "Need to reopen app for update language" : "Необходимо повторно открыть приложение для обновления языка" , preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: LocalizationSystem.sharedInstance.getLanguage() == "en" ? "Okay" : "Хорошо", style: .default, handler: { action in
          exit(0);
        }))
        self.present(alert, animated: true, completion: nil)
      }

}
