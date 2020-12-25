//
//  ViewController.swift
//  OneLab Twitter
//
//  Created by Alikhan Khassen on 24.12.2020.
//

import SnapKit

class TwitterTableViewController: UIViewController {
    
    
    var posts: [Post] = []
    
    private let tableView = UITableView()

    
    private func layoutUI() {
        configureTableView()
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func fetchPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let posts = try! JSONDecoder().decode([Post].self, from: data)
                self.posts = posts
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }.resume()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = . white
        tableView.dataSource = self
        tableView.register(TwitterTableViewCell.self, forCellReuseIdentifier: "TwitterTableViewCell")
    
        layoutUI()
        fetchPosts()
    }
}


extension TwitterTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let twit = posts[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TwitterTableViewCell", for: indexPath) as! TwitterTableViewCell
        cell.usernameLabel.text = "\(twit.userId)"
        cell.twitterTextLabel.text = twit.body
        
        return cell
    }
}

