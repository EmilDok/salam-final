import UIKit

protocol ISecondViewController : AnyObject{
    func getPosts(posts: [Post])
}



class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, IAloha, ISecondViewController {
    
    private let presenter : ISecondPresenter
    
    
    var cellsState:[CellState] = []
    private var posts : [Post] = []
    private var postsToShow : [Post] = []

    
    init(presenter: ISecondPresenter){
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let tableView = UITableView()
    
    func getPosts(posts: [Post]) {
        self.posts = posts
        self.postsToShow = posts
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        posts = presenter.getPost()
        postsToShow = presenter.getPost()
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        
    
        tableView.delegate = self
        tableView.dataSource = self
    
        view.addSubview(tableView)
        
        setupTableView()
        
        let title = UILabel();
        title.text = "Search"
        title.textColor = UIColor(rgb: 0x000000)
        title.frame = CGRect(x: 0, y: 123, width: 80, height: 21)
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        title.center.x = self.view.center.x
        view.addSubview(title)
        
        let field = styleField(placeholder: "Find Something", count: 0,  hasIcon: true)
        
        field.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)

        
        
        view.addSubview(field)
        


    }
    
    @objc func textFieldDidChange(textField: UITextField) {
        if let searchText = textField.text {
            
            if (searchText == ""){
                postsToShow = posts
            } else {
                postsToShow = posts.filter{
                    $0.name.lowercased().contains(searchText.lowercased())
                }
            }
            
            tableView.reloadData()
            
        }
    }
    
    
    

    func setupTableView(){
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -1 * (self.tabBarController?.tabBar.frame.size
            .height)!).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 210).isActive = true
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 600
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsToShow.count
    }
    
    func salam(){
        let certainRecipeViewController = CertainRecipeViewController()
        self.navigationController?.pushViewController(certainRecipeViewController, animated: true)
        print(self.navigationController)
    }
    
    //func cellfor
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        cell.delegate = self
        //cell.personName.text = myPosts[indexPath.row]
        
        var curPost = postsToShow[indexPath.row]
        
        cell.personName.text = presenter.getPersonByPost(post: curPost).firstName
        cell.recipeName.text = curPost.name
        cell.postText.text = curPost.recipeText
        cell.PostImg.image = curPost.image
        cell.personImg.image = presenter.getPersonByPost(post: curPost).avatarImage
        cell.saveCounts.text = "Saved: " + String(presenter.getCountOfPostLikes(post: curPost))
        cell.datePost.text = curPost.date
        cell.PostImg.image = curPost.image
        //cell.postText.text = myTexts[indexPath.row]
        
        if (presenter.checkPostIsSaved(post: curPost)){
            cell.UiImgAddView.image = UIImage(named: "done")
        } else {
            cell.UiImgAddView.image = UIImage(named: "addFavBtn")
        }

        cell.backgroundColor = .clear
        cell.selectionStyle = .none
 
        return cell
    }
    
    
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
            let img = UIImage(named: "11.png")
        
            field.rightImage(img)
            field.rightViewMode = .always
        }
        
        return field
    }
}
//


