// Copyright © 2019 Square1.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit

open class TextViewPlaceholder: UITextView {

  public let placeholderLabel = UILabel()
  
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    configureView()
  }
  
  override public init(frame: CGRect, textContainer: NSTextContainer?) {
    super.init(frame: frame, textContainer: textContainer)
    configureView()
  }
  
  override open func layoutSubviews() {
    super.layoutSubviews()
    
    let placeholderX: CGFloat = textContainer.lineFragmentPadding + textContainerInset.left
    let placeholderY: CGFloat = textContainerInset.top
    let placeholderWidth = frame.width - placeholderX - textContainerInset.right
    let placeholderHeight = frame.height - textContainerInset.bottom * 2
    
    var size = placeholderLabel.sizeThatFits(CGSize(width: placeholderWidth, height: placeholderHeight))
    if size.height > placeholderHeight {
      size.height = placeholderHeight
    }
    placeholderLabel.frame = CGRect(x: placeholderX, y: placeholderY, width: size.width, height: size.height)
  }
  
  // MARK: Private.
  
  private func configureView() {
    placeholderLabel.numberOfLines = 0
    placeholderLabel.font = font
    addSubview(placeholderLabel)
  }
}
