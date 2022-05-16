//
//  FeedTVC.swift
//  Clone-Instagram
//
//  Created by madilyn on 2022/05/16.
//

import UIKit

class FeedTVC: UITableViewCell {
    
    private let profileView = UIView()
    private let profileImageView = UIImageView().then {
        $0.contentMode = .scaleToFill
    }
    private let userIDLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .medium)
    }
    private let moreBtn = UIButton().then {
        $0.setImage(UIImage(named: "More"), for: .normal)
    }
    
    private let feedImageView = UIImageView().then {
        $0.contentMode = .scaleToFill
    }
    
    private let reactionView = UIView()
    private let likeBtn = UIButton().then {
        $0.setImage(UIImage(named: "Like"), for: .normal)
    }
    private let commentBtn = UIButton().then {
        $0.setImage(UIImage(named: "Comment"), for: .normal)
    }
    private let shareBtn = UIButton().then {
        $0.setImage(UIImage(named: "Share"), for: .normal)
    }
    private let bookMarkBtn = UIButton().then {
        $0.setImage(UIImage(named: "Bookmark"), for: .normal)
    }
    
    private let likeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 10, weight: .semibold)
    }
    
    private let postView = UIView()
    private let userNameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .bold)
    }
    private let contentLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 10, weight: .medium)
    }
    private let moreCommentBtn = UIButton().then {
        $0.titleLabel?.font = .systemFont(ofSize: 10, weight: .medium)
        $0.setTitleColor(.gray, for: .normal)
        $0.contentHorizontalAlignment = .left
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        configureUI()
    }
    
    private func configureUI() {
        profileView.addSubviews([profileImageView, userIDLabel, moreBtn])
        reactionView.addSubviews([likeBtn, commentBtn, shareBtn, bookMarkBtn])
        postView.addSubviews([userNameLabel, contentLabel])
        contentView.addSubviews([profileView, feedImageView, reactionView, likeLabel, postView, moreCommentBtn])
        
        setProfileViewUI()
        setReactionViewUI()
        setPostViewUI()
        
        profileView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(46)
        }
        feedImageView.snp.makeConstraints {
            $0.top.equalTo(profileView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(feedImageView.snp.width)
        }
        reactionView.snp.makeConstraints {
            $0.top.equalTo(feedImageView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(40)
        }
        likeLabel.snp.makeConstraints {
            $0.top.equalTo(reactionView.snp.bottom).offset(3)
            $0.leading.trailing.equalToSuperview().inset(12)
        }
        postView.snp.makeConstraints {
            $0.top.equalTo(likeLabel.snp.bottom).offset(5)
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.height.equalTo(14)
        }
        moreCommentBtn.snp.makeConstraints {
            $0.top.equalTo(postView.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.height.equalTo(12)
        }
    }
    
    private func setProfileViewUI() {
        profileImageView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(12)
            $0.leading.equalToSuperview().offset(6)
            $0.width.equalTo(profileImageView.snp.height)
        }
        userIDLabel.snp.makeConstraints {
            $0.centerY.equalTo(profileImageView)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(6)
        }
        moreBtn.snp.makeConstraints {
            $0.top.bottom.trailing.equalToSuperview().inset(10)
        }
    }
    
    private func setReactionViewUI() {
        likeBtn.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(8)
            $0.leading.equalToSuperview().offset(10)
            $0.height.width.equalTo(24)
        }
        commentBtn.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(8)
            $0.leading.equalTo(likeBtn.snp.trailing).offset(10)
            $0.height.width.equalTo(24)
        }
        shareBtn.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(8)
            $0.leading.equalTo(commentBtn.snp.trailing).offset(10)
            $0.height.width.equalTo(24)
        }
        bookMarkBtn.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(8)
            $0.trailing.equalToSuperview().inset(10)
            $0.height.width.equalTo(24)
        }
    }
    
    private func setPostViewUI() {
        userNameLabel.snp.makeConstraints {
            $0.top.bottom.leading.equalToSuperview()
        }
        contentLabel.snp.makeConstraints {
            $0.top.bottom.trailing.equalToSuperview()
            $0.leading.equalTo(userNameLabel.snp.trailing).offset(4)
        }
    }
    
    func setData(data: FeedModelElement) {
        profileImageView.image = UIImage(named: data.profileImageName)
        userIDLabel.text = data.userID
        feedImageView.image = UIImage(named: data.contentImageName)
        likeLabel.text = "좋아요 \(data.likeCount)개"
        userNameLabel.text = data.userID
        contentLabel.text = data.content
        moreCommentBtn.setTitle("댓글 \(data.commentCount)개 모두 보기", for: .normal)
    }
}
