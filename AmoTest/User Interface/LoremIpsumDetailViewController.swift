import UIKit

class LoremIpsumDetailViewController: UIViewController {
    var loremIpsumPhoto: LoremIpsumPhoto? {
        didSet {
            imageView.loadImage(from: loremIpsumPhoto?.url, placeHolder: .placeholder)
            titleLabel.text = loremIpsumPhoto?.title
        }
    }

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    


}
