import UIKit

extension UITextField {
    func rightImage(_ image: UIImage?, imageWidth: CGFloat = 19, padding: CGFloat = 11) {
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: padding, y: 0, width: imageWidth, height: frame.height)
        imageView.contentMode = .center
        
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: imageWidth + 2 * padding, height: frame.height))
        containerView.addSubview(imageView)
        rightView = containerView
        rightViewMode = .always
    }
}


class RegistrationViewController: UIViewController {
    
    func pageTitle(text: String) -> UILabel {
        let title = UILabel(frame: CGRect(x: 136, y: 123, width: 150, height: 21))
        title.text = text
        title.textColor = UIColor(rgb: 0x000000)
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        return title
    }
    
    func styleTextField(placeholder: String, count: Int, isSecure: Bool = false, hasIcon: Bool = false) -> UITextField {
        let field =  UITextField(frame: CGRect(x: 23, y: 166 + count * 66, width: 345, height: 40))
        field.placeholder = placeholder
        field.layer.cornerRadius = 0
        field.backgroundColor = UIColor(rgb: 0xF3F3F3)
        field.font = UIFont.systemFont(ofSize: 14)
        field.borderStyle = UITextField.BorderStyle.roundedRect
        field.autocorrectionType = UITextAutocorrectionType.no
        field.keyboardType = UIKeyboardType.default
        field.returnKeyType = UIReturnKeyType.done
        field.clearButtonMode = UITextField.ViewMode.whileEditing
        field.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        
        isSecure ? field.isSecureTextEntry = true : nil
        
        if (hasIcon) {
            field.rightImage(UIImage(named: "attach.png"))
        }
        
        return field
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(pageTitle(text: "Registration"))
        self.view.addSubview(styleTextField(placeholder: "Image", count: 0, hasIcon: true))
        self.view.addSubview(styleTextField(placeholder: "First name", count: 1))
        self.view.addSubview(styleTextField(placeholder: "Second name", count: 2))
        self.view.addSubview(styleTextField(placeholder: "Email", count: 3))
        self.view.addSubview(styleTextField(placeholder: "Login", count: 4))
        self.view.addSubview(styleTextField(placeholder: "Password", count: 5, isSecure: true))
        self.view.addSubview(styleTextField(placeholder: "Confirm password", count: 6, isSecure: true))
        
        /*let authoTitle = UILabel();
        authoTitle.text = "Registration"
        authoTitle.textColor = UIColor(rgb: 0x000000)
        authoTitle.frame = CGRect(x: 136, y: 123, width: 150, height: 21)
        authoTitle.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        self.view.addSubview(authoTitle)
        
        let image =  UITextField(frame: CGRect(x: 23, y: 166, width: 345, height: 40))
        image.placeholder = "Image"
        image.layer.cornerRadius = 0
        image.backgroundColor = UIColor(rgb: 0xF3F3F3)
        image.font = UIFont.systemFont(ofSize: 14)
        image.borderStyle = UITextField.BorderStyle.roundedRect
        image.autocorrectionType = UITextAutocorrectionType.no
        image.keyboardType = UIKeyboardType.default
        image.returnKeyType = UIReturnKeyType.done
        image.clearButtonMode = UITextField.ViewMode.whileEditing
        image.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        image.rightImage(UIImage(named: "attach.png"))
        self.view.addSubview(image)
        
        let firstName =  UITextField(frame: CGRect(x: 23, y: 222, width: 345, height: 40))
        firstName.placeholder = "First name"
        firstName.layer.cornerRadius = 0
        firstName.backgroundColor = UIColor(rgb: 0xF3F3F3)
        firstName.font = UIFont.systemFont(ofSize: 14)
        firstName.borderStyle = UITextField.BorderStyle.roundedRect
        firstName.autocorrectionType = UITextAutocorrectionType.no
        firstName.keyboardType = UIKeyboardType.default
        firstName.returnKeyType = UIReturnKeyType.done
        firstName.clearButtonMode = UITextField.ViewMode.whileEditing
        firstName.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        self.view.addSubview(firstName)
        
        let secondName =  UITextField(frame: CGRect(x: 23, y: 278, width: 345, height: 40))
        secondName.placeholder = "Second name"
        secondName.layer.cornerRadius = 0
        secondName.backgroundColor = UIColor(rgb: 0xF3F3F3)
        secondName.font = UIFont.systemFont(ofSize: 14)
        secondName.borderStyle = UITextField.BorderStyle.roundedRect
        secondName.autocorrectionType = UITextAutocorrectionType.no
        secondName.keyboardType = UIKeyboardType.default
        secondName.returnKeyType = UIReturnKeyType.done
        secondName.clearButtonMode = UITextField.ViewMode.whileEditing
        secondName.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        self.view.addSubview(secondName)
        
        let email =  UITextField(frame: CGRect(x: 23, y: 334, width: 345, height: 40))
        email.placeholder = "Email"
        email.layer.cornerRadius = 0
        email.backgroundColor = UIColor(rgb: 0xF3F3F3)
        email.font = UIFont.systemFont(ofSize: 14)
        email.borderStyle = UITextField.BorderStyle.roundedRect
        email.autocorrectionType = UITextAutocorrectionType.no
        email.keyboardType = UIKeyboardType.default
        email.returnKeyType = UIReturnKeyType.done
        email.clearButtonMode = UITextField.ViewMode.whileEditing
        email.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        self.view.addSubview(email)
        
        let login =  UITextField(frame: CGRect(x: 23, y: 390, width: 345, height: 40))
        login.placeholder = "Login"
        login.layer.cornerRadius = 0
        login.backgroundColor = UIColor(rgb: 0xF3F3F3)
        login.font = UIFont.systemFont(ofSize: 14)
        login.borderStyle = UITextField.BorderStyle.roundedRect
        login.autocorrectionType = UITextAutocorrectionType.no
        login.keyboardType = UIKeyboardType.default
        login.returnKeyType = UIReturnKeyType.done
        login.clearButtonMode = UITextField.ViewMode.whileEditing
        login.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        self.view.addSubview(login)
        
        let password =  UITextField(frame: CGRect(x: 23, y: 446, width: 345, height: 40))
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
        password.isSecureTextEntry = true
        self.view.addSubview(password)
        
        let passwordCheck =  UITextField(frame: CGRect(x: 23, y: 502, width: 345, height: 40))
        passwordCheck.placeholder = "Confirm password"
        passwordCheck.layer.cornerRadius = 0
        passwordCheck.backgroundColor = UIColor(rgb: 0xF3F3F3)
        passwordCheck.font = UIFont.systemFont(ofSize: 14)
        passwordCheck.borderStyle = UITextField.BorderStyle.roundedRect
        passwordCheck.autocorrectionType = UITextAutocorrectionType.no
        passwordCheck.keyboardType = UIKeyboardType.default
        passwordCheck.returnKeyType = UIReturnKeyType.done
        passwordCheck.clearButtonMode = UITextField.ViewMode.whileEditing
        passwordCheck.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        password.isSecureTextEntry = true
        self.view.addSubview(passwordCheck)*/
        
        let signInBtn = UIButton(frame: CGRect(x: 23, y: 558, width: 345, height: 40))
        signInBtn.backgroundColor = UIColor(rgb: 0x2E2E2E)
        signInBtn.setTitle("Sign In", for: .normal)
        signInBtn.setTitleColor(UIColor(rgb: 0xFFFFFF), for: .normal)
        signInBtn.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        signInBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        self.view.addSubview(signInBtn)
        
        let notSignedUp = UILabel()
        notSignedUp.text = "Not signed up?"
        notSignedUp.textColor = UIColor(rgb: 0x000000)
        notSignedUp.frame = CGRect(x: 23, y: 625, width: 110, height: 16)
        notSignedUp.font = UIFont.systemFont(ofSize: 14)
        //notSignedUp.contentHorizontalAlignment = .left
        self.view.addSubview(notSignedUp)
        
        let toSignUp = UIButton()
        toSignUp.setTitle("Sign up now", for: .normal)
        toSignUp.setTitleColor(UIColor(rgb: 0x000000), for:.normal)
        toSignUp.frame = CGRect(x: 260, y: 625, width: 110, height: 16)
        toSignUp.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        //toSignUp.contentHorizontalAlignment = .right
        //toSignUp. = UIFont.systemFont(ofSize: 14)
        self.view.addSubview(toSignUp)
        // Do any additional setup after loading the view.
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
