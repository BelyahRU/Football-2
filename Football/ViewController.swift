
import UIKit

class ViewController: UIViewController {
    
    private var imageView = UIImageView()
    private let duration: TimeInterval = 1.0
    private let distance: CGFloat = 100.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Настройка imageView
        imageView.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        imageView.backgroundColor = .red
        view.addSubview(imageView)
        
        // Кнопка для запуска анимации
        let startButton = UIButton(type: .system)
        startButton.setTitle("Start", for: .normal)
        startButton.addTarget(self, action: #selector(startAnimation), for: .touchUpInside)
        startButton.frame = CGRect(x: (view.bounds.width - 100) / 2, y: view.bounds.height - 100, width: 100, height: 50)
        view.addSubview(startButton)
    }
    
    @objc func startAnimation() {
        UIView.animate(withDuration: duration, animations: {
            self.imageView.frame.origin.y += self.distance
        })
    }
}
