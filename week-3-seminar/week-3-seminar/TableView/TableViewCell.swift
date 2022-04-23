//
//  TableViewCell.swift
//  week-3-seminar
//
//  Created by madilyn on 2022/04/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    static let ID = "TableViewCell"
    
    @IBOutlet weak var coverImgView: UIImageView!
    @IBOutlet weak var titleNameLabel: UILabel!
    @IBOutlet weak var singerLabel: UILabel!
    @IBOutlet weak var moveBtn: UIButton!
    
    override func awakeFromNib() {
        // 객체가 초기화(인스턴스화)된 후 호출되는 메서드
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(_ data: MusicDataModel) {
        coverImgView.image = data.albumImage
        titleNameLabel.text = data.musicTitle
        singerLabel.text = data.description
    }
}
