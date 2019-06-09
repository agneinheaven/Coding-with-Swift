import UIKit

class ViewController: UIViewController{

var dogsArray:[Any] = [
    [
        "Dogs": [
        "https://www.pexels.com/photo/adorable-animal-breed-canine-356378/",
        "https://www.pexels.com/photo/adorable-blur-breed-close-up-406014/",
        "https://www.pexels.com/photo/black-and-brown-short-haired-puppy-in-cup-39317/",
        "https://www.pexels.com/photo/adult-black-pug-1851164/",
        "https://www.pexels.com/photo/brown-and-white-short-coated-puppy-1805164/",
        "https://www.pexels.com/photo/adorable-animal-canine-cute-220938/",
        "https://www.pexels.com/photo/close-up-photo-of-dog-wearing-sunglasses-1629781/",
        "https://www.pexels.com/photo/adult-golden-retriever-close-up-photography-1490908/",
        "https://www.pexels.com/photo/animal-beagle-canine-close-up-460823/",
        "https://www.pexels.com/photo/dalmatian-sitting-white-surface-933498/"
        ]
    ]
 ]

var finalArray:[Any] = []

for dogDict in dogsArray {
    if let dict = dogDict as? [String: Any], let dogsArray = dict["Dogs"] as? [String] {
        finalArray.append(dogsArray)
    }
 }

print(finalArray)

for dog in finalArray {
  print(dog)
}
 

@IBOutlet weak var imageView: UIImageView!

override func viewDidLoad(){
   super.viewDidLoad()
   for element in finalArray{
      let imageUrl = URL(string:element)!
      downloadImage(with: imageURL)
   }
}
       
func downloadImage(with url: URL){
      URLSession.shared.dataTask(with: url){(data, response, error)
           if error != nil{
                print(error!)
                return
           }
           DispatchQueue.main.async{
           self.imageView.image = UIImage(data: data!)
           }
      }.resume()
 }



//Bonus task
@IBAction func imageTapped(sender: UITapGestureRecognizer) {
    let imageView = sender.view as! UIImageView
    let newImageView = UIImageView(image: imageView.image)
    newImageView.frame = UIScreen.main.bounds
    newImageView.backgroundColor = .blackColor()
    newImageView.contentMode = .ScaleAspectFit
    newImageView.userInteractionEnabled = true
    let tap = UITapGestureRecognizer(target: self, action: "dismissFullscreenImage:")
    newImageView.addGestureRecognizer(tap)
    self.view.addSubview(newImageView)
    self.navigationController?.isNavigationBarHidden = true
    self.tabBarController?.tabBar.isHidden = true
}

func dismissFullscreenImage(sender: UITapGestureRecognizer) {
    self.navigationController?.isNavigationBarHidden = false
    self.tabBarController?.tabBar.isHidden = false
    sender.view?.removeFromSuperview()
}

}
