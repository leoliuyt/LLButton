//
//  LLButton.swift
//  LLButton
//
//  Created by leoliu on 2016/12/11.
//  Copyright © 2016年 LL. All rights reserved.
//

import UIKit

//extension UIButton {
//    
//    public convenience init(type buttonType: UIButtonType)
//    
//    
//    open var contentEdgeInsets: UIEdgeInsets // default is UIEdgeInsetsZero. On tvOS 10 or later, default is nonzero except for custom buttons.
//    
//    open var titleEdgeInsets: UIEdgeInsets // default is UIEdgeInsetsZero
//    
//    open var reversesTitleShadowWhenHighlighted: Bool // default is NO. if YES, shadow reverses to shift between engrave and emboss appearance
//    
//    open var imageEdgeInsets: UIEdgeInsets // default is UIEdgeInsetsZero
//    
//    open var adjustsImageWhenHighlighted: Bool // default is YES. if YES, image is drawn darker when highlighted(pressed)
//    
//    open var adjustsImageWhenDisabled: Bool // default is YES. if YES, image is drawn lighter when disabled
//    
//    open var showsTouchWhenHighlighted: Bool // default is NO. if YES, show a simple feedback (currently a glow) while highlighted
//    
//    @available(iOS 5.0, *)
//    open var tintColor: UIColor! // The tintColor is inherited through the superview hierarchy. See UIView for more information.
//    
//    open var buttonType: UIButtonType { get }
//    
//    
//    // you can set the image, title color, title shadow color, and background image to use for each state. you can specify data
//    // for a combined state by using the flags added together. in general, you should specify a value for the normal state to be used
//    // by other states which don't have a custom value set
//    
//    open func setTitle(_ title: String?, for state: UIControlState) // default is nil. title is assumed to be single line
//    
//    open func setTitleColor(_ color: UIColor?, for state: UIControlState) // default if nil. use opaque white
//    
//    open func setTitleShadowColor(_ color: UIColor?, for state: UIControlState) // default is nil. use 50% black
//    
//    open func setImage(_ image: UIImage?, for state: UIControlState) // default is nil. should be same size if different for different states
//    
//    open func setBackgroundImage(_ image: UIImage?, for state: UIControlState) // default is nil
//    
//    @available(iOS 6.0, *)
//    open func setAttributedTitle(_ title: NSAttributedString?, for state: UIControlState) // default is nil. title is assumed to be single line
//    
//    
//    open func title(for state: UIControlState) -> String? // these getters only take a single state value
//    
//    open func titleColor(for state: UIControlState) -> UIColor?
//    
//    open func titleShadowColor(for state: UIControlState) -> UIColor?
//    
//    open func image(for state: UIControlState) -> UIImage?
//    
//    open func backgroundImage(for state: UIControlState) -> UIImage?
//    
//    @available(iOS 6.0, *)
//    open func attributedTitle(for state: UIControlState) -> NSAttributedString?
//    
//    
//    // these are the values that will be used for the current state. you can also use these for overrides. a heuristic will be used to
//    // determine what image to choose based on the explict states set. For example, the 'normal' state value will be used for all states
//    // that don't have their own image defined.
//    
//    open var currentTitle: String? { get } // normal/highlighted/selected/disabled. can return nil
//    
//    open var currentTitleColor: UIColor { get } // normal/highlighted/selected/disabled. always returns non-nil. default is white(1,1)
//    
//    open var currentTitleShadowColor: UIColor? { get } // normal/highlighted/selected/disabled.
//    
//    open var currentImage: UIImage? { get } // normal/highlighted/selected/disabled. can return nil
//    
//    open var currentBackgroundImage: UIImage? { get } // normal/highlighted/selected/disabled. can return nil
//    
//    @available(iOS 6.0, *)
//    open var currentAttributedTitle: NSAttributedString? { get } // normal/highlighted/selected/disabled. can return nil
//    
//    
//    // return title and image views. will always create them if necessary. always returns nil for system buttons
//    @available(iOS 3.0, *)
//    open var titleLabel: UILabel? { get }
//    
//    @available(iOS 3.0, *)
//    open var imageView: UIImageView? { get }
//    
//    
//    // these return the rectangle for the background (assumes bounds), the content (image + title) and for the image and title separately. the content rect is calculated based
//    // on the title and image size and padding and then adjusted based on the control content alignment. there are no draw methods since the contents
//    // are rendered in separate subviews (UIImageView, UILabel)
//    
//    open func backgroundRect(forBounds bounds: CGRect) -> CGRect
//    
//    open func contentRect(forBounds bounds: CGRect) -> CGRect
//    
//    open func titleRect(forContentRect contentRect: CGRect) -> CGRect
//    
//    open func imageRect(forContentRect contentRect: CGRect) -> CGRect
//}

private enum ButtonContentType : String {
    case title
    case titleColor
    case shadowColor
    case image
    case backgroundImage
}


class LLButton : UIControl {

    var titleLabel: UILabel?
    var imageView: UIImageView?
    var backgroundImageView: UIImageView?
    
    var contentEdgeInsets: UIEdgeInsets = UIEdgeInsets.zero
    var titleEdgeInsets: UIEdgeInsets = UIEdgeInsets.zero
    var imageEdgeInsets: UIEdgeInsets = UIEdgeInsets.zero
    
//    var reversesTitleShadowWhenHighlighted: Bool //false
//    var adjustsImageWhenHighlighted: Bool //true
//    var adjustsImageWhenDisabled: Bool //true
//    var showsTouchWhenHighlighted: Bool //false
    
    var buttonType: UIButtonType?

    private var contentDic: [String : [String : Any]] = [:]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(type: UIButtonType) {
        self.init(frame: CGRect.zero)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let bounds = self.bounds
        let rect = contentRect(forBounds: bounds)
        self.backgroundImageView?.frame = backgroundRect(forBounds: bounds)
        self.titleLabel?.frame = titleRect(forContentRect: rect)
        self.imageView?.frame = imageRect(forContentRect: rect)
    }

    func setTitle(_ title: String?, for state: UIControlState) {
        setContent(title, for: state, type: ButtonContentType.title)
        if let text = title {
            if let label = self.titleLabel {
                label.text = text
            } else {
                titleLabel = UILabel()
                titleLabel?.text = text
                addSubview(titleLabel!)
            }
        } else {
            titleLabel = nil;
        }
        setNeedsLayout()
    }
    
    func setTitleColor(_ color: UIColor?, for state: UIControlState) {
        setContent(color, for: state, type: ButtonContentType.titleColor)
        self.titleLabel?.textColor = color
    }
    
    func setTitleShadowColor(_ color: UIColor?, for state: UIControlState) {
        
    }
    
    func setImage(_ image: UIImage?, for state: UIControlState) {
        setContent(image, for: state, type: ButtonContentType.image)
        if let img = image {
            if let view = self.imageView {
                view.image = image
            } else {
                imageView = UIImageView(image: img)
                addSubview(imageView!)
            }
        } else {
            imageView = nil
        }
        setNeedsLayout()
    }
    
    func setBackgroundImage(_ image: UIImage?, for state: UIControlState) {
        
    }
    
    func setAttributedTitle(_ title: NSAttributedString?, for state: UIControlState) {
        
    }
    
    func title(for state: UIControlState) -> String? {
        return String()
    }
    
    func titleColor(for state: UIControlState) -> UIColor? {
        return UIColor()
    }
    
    func titleShadowColor(for state: UIControlState) -> UIColor? {
        return UIColor()
    }
    
    func image(for state: UIControlState) -> UIImage? {
        return UIImage()
    }
    
    func backgroundImage(for state: UIControlState) -> UIImage? {
        return UIImage()
    }
    
    func attributedTitle(for state: UIControlState) -> NSAttributedString? {
        return NSAttributedString()
    }
    
// normal/highlighted/selected/disabled.
    var currentTitle: String? {
        return titleLabel?.text
    }
    
    var currentTitleColor: UIColor {
        if let color = titleLabel?.textColor {
            return color
        } else {
            return UIColor.white
        }
    }
    
    var currentTitleShadowColor: UIColor? {
        return titleLabel?.shadowColor
    }
    
    var currentImage: UIImage? {
        return imageView?.image
    }
    
    var currentBackgroundImage: UIImage? {
        return backgroundImageView?.image
    }
    
    var currentAttributedTitle: NSAttributedString? {
        return titleLabel?.attributedText
    }
    
    func backgroundRect(forBounds bounds: CGRect) -> CGRect {
        return bounds
    }
    
    func contentRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, contentEdgeInsets)
    }
    
    func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        if (self.titleLabel?.text) != nil {
            let imgSize = imageSize()
            let labelSize = titleSize()
            var inset: UIEdgeInsets = UIEdgeInsets()
            inset.right += imgSize.width
            return componentRect(for: labelSize, contentRect: UIEdgeInsetsInsetRect(contentRect, inset))
        } else {
            return CGRect.zero
        }
    }
    
    func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        if (self.imageView?.image) != nil {
            let imgSize = imageSize()
            let labelSize = titleSize()
            var inset: UIEdgeInsets = UIEdgeInsets()
            inset.left = labelSize.width;
            return componentRect(for: imgSize, contentRect: UIEdgeInsetsInsetRect(contentRect, inset))
        } else {
            return CGRect.zero
        }
    }
    
//MARK:private
//    - (void)_setContent:(id)value forState:(UIControlState)state type:(NSString *)type
//    {
//    NSMutableDictionary *typeContent = [_content objectForKey:type];
//    
//    if (!typeContent) {
//    typeContent = [[NSMutableDictionary alloc] init];
//    [_content setObject:typeContent forKey:type];
//    }
//    
//    NSNumber *key = [NSNumber numberWithInt:state];
//    if (value) {
//    [typeContent setObject:value forKey:key];
//    } else {
//    [typeContent removeObjectForKey:key];
//    }
//    
//    [self _updateContent];
//    }

    private func setContent(_ value: Any?, for state: UIControlState, type: ButtonContentType) {
        let contentKey: String = type.rawValue
        let typeKey = String(state.rawValue)
        var typeContent = contentDic[contentKey]
        guard var typeDic = typeContent else {
            if let content = value {
                typeContent = [typeKey:content]
                contentDic[contentKey] = typeContent
                updateContent()
            }
            return
        }
        
        if let content = value {
            typeDic[typeKey] = content
            contentDic[contentKey] = typeDic
        } else {
            _ = typeDic.removeValue(forKey: typeKey)
            if typeDic.values.count > 0 {
                contentDic[contentKey] = typeDic
            } else {
                contentDic.removeValue(forKey: contentKey)
            }
        }
        
        updateContent()
    }
    
    private func updateContent(){
    
    }
    
    private func contentForState(for state: UIControlState, type: ButtonContentType) -> Any? {
        let contentKey: String = type.rawValue
        let typeKey = String(state.rawValue)
        return contentDic[contentKey]?[typeKey]
    }
    
    private func defaultContentForState(for state: UIControlState, type: ButtonContentType) -> Any? {
        
        if let value = contentForState(for: state, type: type) {
            return value
        } else {
            return contentForState(for: .normal, type: type)
        }
    }
    
    private func titleSize() -> CGSize {
        if let label = self.titleLabel , let text = label.text{
            let string: NSString = NSString(string: text);
            let size = CGSize(width: 1000, height: 1000)
            let dict = [NSFontAttributeName:label.font,
                        NSBackgroundColorAttributeName:label.textColor
            ]
            let labelSize = string.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dict, context: nil).size;
            return CGSize(width: ceil(labelSize.width) + 1, height: ceil(labelSize.height))
        } else {
            return CGSize.zero
        }
    }
    
    private func imageSize() -> CGSize {
        if let image = self.imageView?.image {
            return image.size
        }else {
            return CGSize.zero
        }
    }
    
    private func componentRect(for size: CGSize, contentRect: CGRect) -> CGRect {
        var rect: CGRect = CGRect.zero
        rect.origin = contentRect.origin
        rect.size = size
        
        if rect.maxX > contentRect.maxX {
            rect.size.width -= (rect.maxX - contentRect.maxX)
        }
        rect.origin.x += CGFloat(floorf(Float(contentRect.size.width - rect.size.width)/2.0))
        rect.origin.y += CGFloat(floorf(Float(contentRect.size.height - rect.size.height)/2.0));
        return rect
    }

}
