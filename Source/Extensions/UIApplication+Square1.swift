// Copyright © 2017 Square1.
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

/// Helpers for UIApplication.
public extension UIApplication {
  
  /// Simple variable to change Status Bar color.
  public var statusBarColor: UIColor? {
    get {
      guard let statusBarView = value(forKey: "statusBar") as? UIView else { return nil }
      return statusBarView.backgroundColor
    }
    
    set {
      guard let statusBarView = value(forKey: "statusBar") as? UIView else { return }
      statusBarView.backgroundColor = newValue
    }
  }
  
  /// Opens passed URL object.
  ///
  /// - Parameter url: URL to be opened on the App.
  public func open(url: URL) {
    guard canOpenURL(url) else { return }
    if #available(iOS 10.0, *) {
      open(url, options: [:], completionHandler: nil)
    } else {
      openURL(url)
    }
  }
  
}
