//
//  MusicCollectionViewCell.swift
//  week-3-seminar
//
//  Created by madilyn on 2022/04/23.
//

import UIKit

class MusicCollectionViewCell: UICollectionViewCell {

    static let ID = "MusicCollectionViewCell"
    @IBOutlet weak var albumCoverImgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var singerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(_ data: AlbumDataModel) {
        albumCoverImgView.image = UIImage(named: data.albumImageName)
        titleLabel.text = data.albumTitle
        singerLabel.text = data.albumSinger
    }
}
