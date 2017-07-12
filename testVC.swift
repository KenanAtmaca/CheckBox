import UIKit

class testVC: UIViewController {
    
    var box:CheckBox!
    var box2:CheckBox!
    var box3:CheckBox!
    var box4:CheckBox!
    var box5:CheckBox!
    var box6:CheckBox!

    override func viewDidLoad() {
        super.viewDidLoad()

        box = CheckBox(view: self.view, style: .oval)
        box.create(size: .small , center: CGPoint(x: 50, y: 50))
        box.animation = .scale
    
        box2 = CheckBox(view: self.view, style: .rect)
        box2.create(size: .small, center: CGPoint(x: 100, y: 50))
        
        box3 = CheckBox(view: self.view, style: .oval)
        box3.create(size: .small, center: CGPoint(x: 50, y: 100))
        
        box4 = CheckBox(view: self.view, style: .rect)
        box4.create(size: .small, center: CGPoint(x: 100, y: 100))
        
        box5 = CheckBox(view: self.view, style: .oval)
        box5.create(size: .small, center: CGPoint(x: 50, y: 150))
        box5.windowBorderColor = UIColor.blue
        box5.contentColor = UIColor.green
        
        box6 = CheckBox(view: self.view, style: .rect)
        box6.create(size: .small, center: CGPoint(x: 100, y: 150))
        box6.windowBorderColor = UIColor.cyan
        box6.contentColor = UIColor.orange
        
    }
    

}//
