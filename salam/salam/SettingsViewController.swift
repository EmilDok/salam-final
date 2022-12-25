import UIKit

class SettingsViewController: UIViewController {
    
    func styleField(placeholder: String, count: Int, isSecure: Bool = false, hasIcon: Bool = false) -> UITextField {
        let field =  UITextField(frame: CGRect(x: 23, y: 160 + count * 60, width: 345, height: 40))
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
            let imgV = UIImageView()
            let img = UIImage(named: "attach.png")
            imgV.image = img
            field.rightView = imgV
            field.rightViewMode = .always
        }
        
        return field
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let title = UILabel();
        title.text = "Settings"
        title.textColor = UIColor(rgb: 0x000000)
        title.frame = CGRect(x: 0, y: 123, width: 80, height: 21)
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        title.center.x = self.view.center.x
        self.view.addSubview(title)
        
        
        self.view.addSubview(styleField(placeholder: "Image", count: 0, isSecure: false, hasIcon: true))
        
        self.view.addSubview(styleField(placeholder: "First name", count: 1))
        
        self.view.addSubview(styleField(placeholder: "Second name", count: 2))
        
        self.view.addSubview(styleField(placeholder: "Email", count: 3))
        
        self.view.addSubview(styleField(placeholder: "Login", count: 4))
        
        self.view.addSubview(styleField(placeholder: "Password", count: 5, isSecure: true))
        
        self.view.addSubview(styleField(placeholder: "Confirm password", count: 6, isSecure: true))
        
        let Save = UIButton(frame: CGRect(x: 23, y: 580, width: 345, height: 40))
        Save.backgroundColor = UIColor(rgb: 0x2E2E2E)
        Save.setTitle("Save", for: .normal)
        Save.setTitleColor(UIColor(rgb: 0xFFFFFF), for: .normal)
        Save.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        Save.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        self.view.addSubview(Save)
    }
}
