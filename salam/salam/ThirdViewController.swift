import UIKit

class ThirdViewController: UIViewController {
    let loginBtn = UIButton()
    let registrBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        StyleButton(btn: loginBtn, yParam: -60, btnTitle: "Sign In", viewRef: #selector(didtapLoginButton))
        StyleButton(btn: registrBtn, yParam: 60, btnTitle: "Sign Up", viewRef: #selector(didtapRegButton))
    }
        
    func StyleButton(btn: UIButton, yParam: Int, btnTitle: String, viewRef: Selector) {
        btn.frame = CGRect(x: 0, y: 0, width: 300, height: 100)
        btn.backgroundColor = UIColor.black
        btn.setTitle(btnTitle, for: .normal)
        btn.center.x = self.view.center.x
        btn.center.y = self.view.center.y + CGFloat(yParam)
        view.addSubview(btn)
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: viewRef, for: .touchUpInside)
    }
    
    @objc func didtapLoginButton() {
        let rootVC = SignInAssembly.assembly()
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
            
        self.present(navVC, animated: true, completion: nil)
    }
        
    @objc func didtapRegButton() {
        let rootVC = RegistrationViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
            
        self.present(navVC, animated: true, completion: nil)
    }
}
    // MARK:- ---> UITextFieldDelegate
