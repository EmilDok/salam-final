import UIKit

class FourthViewController: UIViewController {
    
    
    func styleField(placeholder: String, yParam: Int, hasIcon: Bool = false, height: Int = 40) -> UITextField {
        let field =  UITextField(frame: CGRect(x: 23, y: yParam, width: 345, height: height))
        field.placeholder = placeholder
        field.layer.cornerRadius = 0
        field.backgroundColor = UIColor(rgb: 0xF3F3F3)
        field.font = UIFont.systemFont(ofSize: 14)
        field.borderStyle = UITextField.BorderStyle.roundedRect
        field.autocorrectionType = UITextAutocorrectionType.no
        field.keyboardType = UIKeyboardType.default
        field.returnKeyType = UIReturnKeyType.done
        field.clearButtonMode = UITextField.ViewMode.whileEditing
        field.contentVerticalAlignment = height > 40 ? UIControl.ContentVerticalAlignment.top : UIControl.ContentVerticalAlignment.center
        
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
        title.text = "Add recipe"
        title.textColor = UIColor(rgb: 0x000000)
        title.frame = CGRect(x: 0, y: 123, width: 100, height: 21)
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        title.center.x = self.view.center.x
        self.view.addSubview(title)
        
        self.view.addSubview(styleField(placeholder: "Image", yParam: 160, hasIcon: true))
        
        self.view.addSubview(styleField(placeholder: "Title", yParam: 220))
        
        self.view.addSubview(styleField(placeholder: "Description", yParam: 280, hasIcon: false, height: 260))

        let Save = UIButton(frame: CGRect(x: 23, y: 580, width: 345, height: 40))
        Save.backgroundColor = UIColor(rgb: 0x2E2E2E)
        Save.setTitle("Post", for: .normal)
        Save.setTitleColor(UIColor(rgb: 0xFFFFFF), for: .normal)
        Save.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        Save.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        self.view.addSubview(Save)
    }
}
