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

import Foundation


/// Helper log method for more accurate console prints.
///
/// Print will only happen on DEBUG.
///
/// Inspired by https://github.com/JungleCandy/LoggingPrint/blob/master/LoggingPrint.swift
/// - Parameters:
///   - object: Object to be printed. Can be an expression.
///   - file: Name of the file calling this function. By default, the source file without .swift extension.
///   - function: Name of the function calling this function. By default, same name as function where this is called.
///   - line: Line number where this function is called. By default, line number within the file where the call is made.
public func SQ1Log<T> (_ object: @autoclosure () -> T,
                       _ file: String = #file,
                       _ function: String = #function,
                       _ line: Int = #line) {
  #if DEBUG
    let value = object()
    let fileURL = URL(string: file)?.lastPathComponent ?? "Unknown file"
    let queue = Thread.isMainThread ? "UI" : "BG"
    
    print("(\(queue)) \(fileURL) \(function) [\(line)]: " + String(reflecting: value))
  #endif
}
