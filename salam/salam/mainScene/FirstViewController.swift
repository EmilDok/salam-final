import UIKit

struct CellState {
    var selected:Bool
    init(){
        selected = false
    }
}

protocol IFirstViewController : AnyObject{
    func getPosts(posts: [Post])
}

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, IAloha, IFirstViewController {
    
    func getPosts(posts: [Post]) {
        self.posts = posts
        self.postsToShow = posts
    }

    
    var cellsState:[CellState] = []
    
    private let presenter : IFirstPresenter
    private let curUser: Person
    
    private var posts : [Post] = []
    private var postsToShow : [Post] = []

    
    init(presenter: IFirstPresenter, user: Person){
        self.presenter = presenter
        self.curUser = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        
        
        posts = presenter.getPost()
        postsToShow = presenter.getPost()
        
    
        tableView.delegate = self
        tableView.dataSource = self

        view.addSubview(tableView)
        
        setupTableView()
    }
    

    func setupTableView(){
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -1 * (self.tabBarController?.tabBar.frame.size
            .height)!).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
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
        
        if (presenter.checkPostIsSaved(post: curPost)){
            cell.UiImgAddView.image = UIImage(named: "done")
        } else {
            cell.UiImgAddView.image = UIImage(named: "addFavBtn")
        }
        
        //cell.postText.text = myTexts[indexPath.row]

        cell.backgroundColor = .clear
        cell.selectionStyle = .none
 
        return cell
    }
}
//

