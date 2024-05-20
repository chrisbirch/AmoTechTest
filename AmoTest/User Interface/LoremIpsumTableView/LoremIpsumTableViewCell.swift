import UIKit

class LoremIpsumTableViewCell: UITableViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    var loremIpsumPhotoItem: LoremIpsumPhoto? {
        didSet {
            photoImageView.loadImage(from: loremIpsumPhotoItem?.thumbnailUrl, placeHolder: .placeholder)
            nameLabel.text = loremIpsumPhotoItem?.title ?? ""
        }
    }
}
