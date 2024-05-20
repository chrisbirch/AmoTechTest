//Mod=ified form of
//https://stackoverflow.com/a/37019507

import UIKit
extension UIImageView {
    func loadImage(from url: URL?, placeHolder: UIImage?) {
        image = placeHolder
        guard let url else { return }
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error {
                print("ERROR LOADING IMAGES FROM URL: \(error)")
                DispatchQueue.main.async {
                    self.image = placeHolder
                }
                return
            }
            DispatchQueue.main.async {
                if let data = data {
                    if let downloadedImage = UIImage(data: data) {

                        self.image = downloadedImage
                    }
                }
            }
        }).resume()

    }
}
