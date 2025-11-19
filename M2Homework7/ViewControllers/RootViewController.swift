//
//  ViewController.swift
//  M2Homework7
//
//  Created by Oleg Konstantinov on 18.11.2025.
//

import UIKit

class RootViewController: UIViewController {
    
    private let posts = Post.mockLoadData()
    
    private lazy var tableView: UITableView = {
        $0.register(CustomViewCell.self, forCellReuseIdentifier: "cell")
        $0.dataSource = self
        $0.delegate = self
        $0.separatorStyle = .none
        return $0
    }(UITableView(frame: view.frame, style: .plain))
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        
    }
}

extension RootViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomViewCell {
            cell.setupCell(item: posts[indexPath.row])
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
    
}

extension RootViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailsViewCellViewController(posts: posts[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
}

