import UIKit

protocol HeaderView {
    func setTitle(_ string: String)
}

final class Header {
    let proto: HeaderView
    let view: UIView
    
    init<V: UIView>(headerView: V) where V: HeaderView {
        self.proto = headerView
        self.view = headerView
    }
}

class ParallaxView: UIView {
    let headerView: Header
    
    init(frame: CGRect, headerView: Header) {
        self.headerView = headerView
        super.init(frame: frame)
        
        addSubview(headerView.view)
        headerView.proto.setTitle("Hello")
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError()
    }
}

extension UILabel: HeaderView {
    func setTitle(_ string: String) {
        text = string
    }
}

let header = Header(headerView: UILabel())
let p = ParallaxView(frame: .zero, headerView: header)

