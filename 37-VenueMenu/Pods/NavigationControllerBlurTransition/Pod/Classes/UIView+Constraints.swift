//Copyright (c) 2015 Prolific Interactive.
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in
//all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//THE SOFTWARE.


import UIKit

private var installedConstraintsHandle: UInt8 = 0

internal extension UIView
{
    var installedConstraints: [NSLayoutConstraint]? {
        get {
            return objc_getAssociatedObject(self, &installedConstraintsHandle) as? [NSLayoutConstraint]
        } set {
            objc_setAssociatedObject(self, &installedConstraintsHandle, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }

    func makeEdgesEqualTo(view: UIView)
    {
        self.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = NSLayoutConstraint(item: self,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: view,
            attribute: .Top,
            multiplier: 1.0,
            constant: 0.0)

        let bottomConstraint = NSLayoutConstraint(item: self,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: view,
            attribute: .Bottom,
            multiplier: 1.0,
            constant: 0.0)

        let leadingConstraint = NSLayoutConstraint(item: self,
            attribute: .Leading,
            relatedBy: .Equal,
            toItem: view,
            attribute: .Leading,
            multiplier: 1.0,
            constant: 0.0)

        let trailingConstraint = NSLayoutConstraint(item: self,
            attribute: .Trailing,
            relatedBy: .Equal,
            toItem: view,
            attribute: .Trailing,
            multiplier: 1.0,
            constant: 0.0)

        let constraints = [topConstraint, bottomConstraint, leadingConstraint, trailingConstraint]
        view.addConstraints(constraints)

        self.installedConstraints = constraints
    }

    func makeConstraintsToRightOfView(view: UIView)
    {
        view.layoutIfNeeded()
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let topConstraint = NSLayoutConstraint(item: self,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: view,
            attribute: .Top,
            multiplier: 1.0,
            constant: 0.0)

        let bottomConstraint = NSLayoutConstraint(item: self,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: view,
            attribute: .Bottom,
            multiplier: 1.0,
            constant: 0.0)

        let leadingConstraint = NSLayoutConstraint(item: self,
            attribute: .Leading,
            relatedBy: .Equal,
            toItem: view,
            attribute: .Leading,
            multiplier: 1.0,
            constant: CGRectGetWidth(view.frame))

        let widthConstraint = NSLayoutConstraint(item: self,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: view,
            attribute: .Width,
            multiplier: 1.0,
            constant: 0.0)

        let constraints = [topConstraint, bottomConstraint, leadingConstraint, widthConstraint]
        view.addConstraints(constraints)
        self.installedConstraints = constraints
    }

    func removeInstalledConstraints()
    {
        guard let constraints = self.installedConstraints else {
            return
        }

        NSLayoutConstraint.deactivateConstraints(constraints)
    }
}
