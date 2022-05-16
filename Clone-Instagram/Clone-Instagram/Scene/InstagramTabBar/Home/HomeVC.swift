//
//  HomeVC.swift
//  Clone-Instagram
//
//  Created by madilyn on 2022/04/22.
//

import UIKit

class HomeVC: BaseVC {
    
    // MARK: Properties
    private let naviView = HomeNaviView()
    private let storyCV = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        $0.backgroundColor = .white
        $0.contentInset = UIEdgeInsets.init(top: 0, left: 20, bottom: 0, right: 0)
        $0.showsHorizontalScrollIndicator = false
        $0.collectionViewLayout = layout
    }
    private let grayLine = UIView().then {
        $0.backgroundColor = .systemGray5
    }
    private let feedTV = UITableView().then {
        $0.backgroundColor = .yellow
    }
    
    var storyDummyData: HomeStoryModel = [
        HomeStoryModelElement(profileImageName: "avatar1", userID: "user1"),
        HomeStoryModelElement(profileImageName: "avatar2", userID: "user2"),
        HomeStoryModelElement(profileImageName: "avatar3", userID: "user3"),
        HomeStoryModelElement(profileImageName: "avatar4", userID: "user4"),
        HomeStoryModelElement(profileImageName: "avatar5", userID: "user5"),
        HomeStoryModelElement(profileImageName: "avatar6", userID: "user6"),
        HomeStoryModelElement(profileImageName: "avatar1", userID: "user7")
    ]
    
    var feedDummyData: FeedModel = [
        FeedModelElement(profileImageName: "avatar1", userID: "user1", contentImageName: "postImage1", likeCount: 3, content: "hi", commentCount: 2),
        FeedModelElement(profileImageName: "avatar2", userID: "user2", contentImageName: "postImage2", likeCount: 31, content: "hello", commentCount: 1),
        FeedModelElement(profileImageName: "avatar3", userID: "user3", contentImageName: "postImage3", likeCount: 33, content: "bye", commentCount: 21)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        registerCell()
    }
    
    private func configureUI() {
        view.addSubviews([naviView, storyCV, grayLine,feedTV])
        
        storyCV.dataSource = self
        feedTV.dataSource = self
        feedTV.delegate = self
        
        naviView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
            $0.height.equalTo(44)
        }
        
        storyCV.snp.makeConstraints {
            $0.top.equalTo(naviView.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(72)
        }
        
        grayLine.snp.makeConstraints {
            $0.top.equalTo(storyCV.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        feedTV.snp.makeConstraints {
            $0.top.equalTo(grayLine.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    private func registerCell() {
        self.storyCV.register(StoryCVC.self, forCellWithReuseIdentifier: StoryCVC.className)
        self.feedTV.register(FeedTVC.self, forCellReuseIdentifier: FeedTVC.className)
    }
}

extension HomeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storyDummyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCVC.className, for: indexPath) as! StoryCVC
        cell.setData(data: storyDummyData[indexPath.row])
        
        return cell
    }
}

extension HomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedDummyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FeedTVC.className, for: indexPath) as! FeedTVC
        cell.setData(data: feedDummyData[indexPath.row])
        
        return cell
    }
}

extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 540
    }
}
