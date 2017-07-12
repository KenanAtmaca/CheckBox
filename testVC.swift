import UIKit

class testVC: UIViewController {
    
    var box:CheckBox!

    override func viewDidLoad() {
        super.viewDidLoad()

        box = CheckBox(view: self.view, style: .oval)
      //  box.contentColor = UIColor.green
        box.create(size: .small , center: CGPoint(x: 50, y: 50))
        box.animation = .scale
       // box.windowBorderColor = UIColor.green
        
    }

 
   

}//
