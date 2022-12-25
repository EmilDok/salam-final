import UIKit

protocol ISignInViewController : AnyObject{
    func checkSignIn(login: String, password: String) -> Bool
}

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}

public var loginTextField: UITextField = {
    let field =  UITextField(frame: CGRect(x: 23, y: 167, width: 345, height: 40))
    field.placeholder = "Login"
    field.text = nil
    field.layer.cornerRadius = 0
    field.backgroundColor = UIColor(rgb: 0xF3F3F3)
    field.font = UIFont.systemFont(ofSize: 14)
    field.borderStyle = UITextField.BorderStyle.roundedRect
    field.autocorrectionType = UITextAutocorrectionType.no
    field.keyboardType = UIKeyboardType.default
    field.returnKeyType = UIReturnKeyType.done
    field.clearButtonMode = UITextField.ViewMode.whileEditing
    field.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
    field.autocapitalizationType = .none
    
    //field.rightImage(UIImage(named: "attach.png"))
    
    return field
    
}()

public var passTextField: UITextField = {
    let field =  UITextField(frame: CGRect(x: 23, y: 167 + 59, width: 345, height: 40))
    field.placeholder = "Password"
    field.text = nil
    field.layer.cornerRadius = 0
    field.backgroundColor = UIColor(rgb: 0xF3F3F3)
    field.font = UIFont.systemFont(ofSize: 14)
    field.borderStyle = UITextField.BorderStyle.roundedRect
    field.autocorrectionType = UITextAutocorrectionType.no
    field.keyboardType = UIKeyboardType.default
    field.returnKeyType = UIReturnKeyType.done
    field.clearButtonMode = UITextField.ViewMode.whileEditing
    field.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
    field.autocapitalizationType = .none

    field.isSecureTextEntry = true
    //field.rightImage(UIImage(named: "attach.png"))
    
    return field
    
}()

class SignInViewController: UIViewController, ISignInViewController{
    
    var cellsState:[CellState] = []
    
    private let presenter : ISignInPresenter
    
    private var posts : [Post] = []
    private var postsToShow : [Post] = []

    
    init(presenter: ISignInPresenter){
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func checkSignIn(login: String, password: String) -> Bool{
        return true
    }
    
    @objc func didTapSignInButton() {
        
        let curLoginInField = loginTextField.text!
        let curPassInField = passTextField.text!
        
        if (curLoginInField != "" && curPassInField != ""){
            if (presenter.checkSignIn(login: curLoginInField, password: curPassInField)){
                
                var curUser = presenter.getUserByLoginAndPassword(login: curLoginInField, password: curPassInField)

                let VCs = [FirstAssembly.assembly(user: curUser), SecondAssembly.assembly(), ThirdViewController(), FourthViewController()]

                VCs[0].tabBarItem.image = UIImage(named: "1")
                VCs[1].tabBarItem.image = UIImage(named: "2")
                VCs[2].tabBarItem.image = UIImage(named: "3")
                VCs[3].tabBarItem.image = UIImage(named: "4")

                for VC in VCs {
                    VC.tabBarItem.imageInsets = UIEdgeInsets(top: 15, left: 0, bottom: -15, right: 0)
                }

                let tabBarVC = UITabBarController()
                tabBarVC.setViewControllers(VCs, animated: true)
                
                
                let navVC = UINavigationController(rootViewController: tabBarVC)
                navVC.modalPresentationStyle = .fullScreen
                    
                self.present(navVC, animated: true, completion: nil)
                
            } else {
                throwAuthAlert()
            }
        } else {
            throwAuthAlert()
        }
        
    }
    
    func throwAuthAlert(){
        let alertController = UIAlertController(title: "Wrong data", message: "Please, type correct login and password or sign up, if don't have an account.", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default){(action) in
            
        }
        
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }

    
    func pageTitle(text: String) -> UILabel {
        let title = UILabel(frame: CGRect(x: 136, y: 123, width: 150, height: 21))
        title.text = text
        title.textColor = UIColor(rgb: 0x000000)
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        return title
    }
    
//    func styleTextField(placeholder: String, count: Int, isSecure: Bool = false, hasIcon: Bool = false) -> UITextField {
//
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(pageTitle(text: "Authorization"))
        self.view.addSubview(loginTextField)
        self.view.addSubview(passTextField)
    
        /*let authoTitle = UILabel();
        authoTitle.text = "Authorization"
        authoTitle.textColor = UIColor(rgb: 0x000000)
        authoTitle.frame = CGRect(x: 136, y: 123, width: 150, height: 21)
        authoTitle.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        //authoTitle.center = self.view.center
        //notSignedUp.contentHorizontalAlignment = .left
        self.view.addSubview(authoTitle)
        
        let login =  UITextField(frame: CGRect(x: 23, y: 167, width: 345, height: 40))
        login.placeholder = "Login"
        login.layer.cornerRadius = 0
        login.backgroundColor = UIColor(rgb: 0xF3F3F3)
        login.font = UIFont.systemFont(ofSize: 14)
        login.borderStyle = UITextField.BorderStyle.roundedRect
        login.autocorrectionType = UITextAutocorrectionType.no
        login.keyboardType = UIKeyboardType.default
        login.returnKeyType = UIReturnKeyType.done
        login.clearButtonMode = UITextField.ViewMode.whileEditing
        //login.borderStyle = UITextField.BorderStyle.line
        //login.layer.borderColor = UIColor(rgb: 0xF3F3F3).cgColor
        login.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        self.view.addSubview(login)
        
        let password =  UITextField(frame: CGRect(x: 23, y: 226, width: 345, height: 40))
        password.placeholder = "Password"
        password.layer.cornerRadius = 0
        password.backgroundColor = UIColor(rgb: 0xF3F3F3)
        password.font = UIFont.systemFont(ofSize: 14)
        password.borderStyle = UITextField.BorderStyle.roundedRect
        password.autocorrectionType = UITextAutocorrectionType.no
        password.keyboardType = UIKeyboardType.default
        password.returnKeyType = UIReturnKeyType.done
        password.clearButtonMode = UITextField.ViewMode.whileEditing
        password.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        self.view.addSubview(password)*/

        let signInBtn = UIButton(frame: CGRect(x: 23, y: 306, width: 345, height: 40))
        signInBtn.backgroundColor = UIColor(rgb: 0x2E2E2E)
        signInBtn.setTitle("Sign In", for: .normal)
        signInBtn.setTitleColor(UIColor(rgb: 0xFFFFFF), for: .normal)
        signInBtn.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        signInBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        signInBtn.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)

        self.view.addSubview(signInBtn)
        
        let notSignedUp = UILabel()
        notSignedUp.text = "Not signed up?"
        notSignedUp.textColor = UIColor(rgb: 0x000000)
        notSignedUp.frame = CGRect(x: 23, y: 376, width: 110, height: 16)
        notSignedUp.font = UIFont.systemFont(ofSize: 14)
        //notSignedUp.contentHorizontalAlignment = .left
        self.view.addSubview(notSignedUp)
        
        let toSignUp = UIButton()
        toSignUp.setTitle("Sign up now", for: .normal)
        toSignUp.setTitleColor(UIColor(rgb: 0x000000), for:.normal)
        toSignUp.frame = CGRect(x: 260, y: 376, width: 110, height: 16)
        toSignUp.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        //toSignUp.contentHorizontalAlignment = .right
        //toSignUp. = UIFont.systemFont(ofSize: 14)
        self.view.addSubview(toSignUp)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
