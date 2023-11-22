//
//  GameViewController.swift
//  Football
//
//  Created by Александр Андреев on 04.08.2023.
//

import UIKit
import SnapKit

class GameViewController: UIViewController {
    
    private let gameView = GameView()
    private var backButton = UIButton()
    private var rightButton = UIButton()
    private var leftButton = UIButton()
    private var player = UIImageView()
    private var score = 0
    
    private var ballPosition = CGFloat()
    private var ballTimer: Timer?
    
    
    private let animationDuration: TimeInterval = 1.0
    private var startPoint = CGPoint()
    private var controlPoint = CGPoint()
    
    private var endPoint = CGPoint()

    
    
    private var ball: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: AppDelegate.shared.currentBall+"Im"), for: .normal)
        return button
        
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        configureBall()
    }

    
    private func configureBall() {
        view.addSubview(ball)
        ball.snp.makeConstraints { make in
            make.width.height.equalTo(50)
            make.centerX.equalTo(player.snp.leading)
            //make.bottom.equalTo(player.snp.bottom).inset(80)
        }
        
        ballTimer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(updateBallPosition), userInfo: nil, repeats: true)
        // Начинаем получать данные с гироскопа
    }
    
    private func configure() {
        view.addSubview(gameView)
        gameView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        
        startPoint = CGPoint(x: 100.0, y: 400.0)
        controlPoint = CGPoint(x: UIScreen.main.bounds.width / 2, y: 100.0)
        
        endPoint = CGPoint(x: UIScreen.main.bounds.width - 100.0, y: 500)
        
        backButton = gameView.backButton
        backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
        rightButton = gameView.rightKickButton
        leftButton = gameView.leftKickButton
        player = gameView.playerImageView
        rightButton.addTarget(self, action: #selector(rightPressed), for: .touchUpInside)
        leftButton.addTarget(self, action: #selector(leftPressed), for: .touchUpInside)
        
    }
    

}
private extension GameViewController {
    @objc func updateBallPosition() {
        // Обновляем позицию мяча по вертикали (смещение падения)
        ball.center.y += 10
        // Проверяем столкновение мяча с футболистом
        if ball.frame.intersects(player.frame) {
            // Логика отбивания мяча
            // Увеличиваем счет игрока
        }
        // Проверка падения мяча на газон
        if Int(ball.frame.origin.y) >= Int(player.frame.maxY)  {
            ballTimer?.invalidate()
            ballTimer = nil
            ball.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(Int(player.frame.maxY))
            }
            //MARK: Переход на экран проигрыша
            let vc = GameIsEndViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }


}


private extension GameViewController {
    @objc func rightPressed() {
        if ((ballTimer?.isValid) != nil) {
            player.image = UIImage(named: AppDelegate.shared.currentTShirt+AppDelegate.shared.currentShorts+"Right1")
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                // Установите второе изображение
                self.player.image = UIImage(named: AppDelegate.shared.currentTShirt+AppDelegate.shared.currentShorts+"Right2")
            }
            
            if abs((player.frame.maxY-80)-ball.frame.minY) <= 70 {
                print("Ок")
                AppDelegate.shared.scores += 1
                AppDelegate.shared.scoresInGame += 1
                gameView.scoreLabel.text = "\(AppDelegate.shared.scoresInGame)"
                startPoint.y = ball.center.y + 20
                startPoint.x = 300
                print(ball.center.y, ball.center.y)
                
                
                endPoint.x = 100
                endPoint.y = ball.frame.minY + 100
                ball.snp.makeConstraints { make in
                    make.top.equalToSuperview().offset(Int(ball.frame.minY))
                }
                print("dfgwedfg")
                kick()
            }
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                // Установите второе изображение
                self.player.image = UIImage(named: AppDelegate.shared.currentTShirt+AppDelegate.shared.currentShorts+"Right1")
            }
        }
    }
    
    @objc func leftPressed() {
        if ((ballTimer?.isValid) != nil) {
            player.image = UIImage(named: AppDelegate.shared.currentTShirt+AppDelegate.shared.currentShorts+"Left1")
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                // Установите второе изображение
                self.player.image = UIImage(named: AppDelegate.shared.currentTShirt+AppDelegate.shared.currentShorts+"Left2")
            }
            if abs((player.frame.maxY-80)-ball.frame.minY) <= 70 {
                AppDelegate.shared.scores += 1
                AppDelegate.shared.scoresInGame += 1
                gameView.scoreLabel.text = "\(AppDelegate.shared.scoresInGame)"
                
                startPoint.y = ball.center.y + 20
                startPoint.x = 100
                
                endPoint.x = 300
                endPoint.y = ball.frame.minY + 100
                ball.snp.makeConstraints { make in
                    make.top.equalToSuperview().offset(Int(ball.frame.minY))
                }
                
                kick()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                // Установите второе изображение
                self.player.image = UIImage(named: AppDelegate.shared.currentTShirt+AppDelegate.shared.currentShorts+"Left1")
            }
        }
    }
    
    private func kick() {
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = createBezierPath().cgPath
        animation.duration = animationDuration
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        ball.layer.add(animation, forKey: "positionAnimation")
        //MARK: Логика добавления очков
        print("отбил")
    }
    
    private func createBezierPath() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: startPoint)
        path.addQuadCurve(to: endPoint, controlPoint: controlPoint)
        return path
    }
}
private extension GameViewController {
    @objc func backPressed() {
        navigationController?.popViewController(animated: true)
    }
}
