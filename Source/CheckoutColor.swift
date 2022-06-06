import UIKit

extension UIColor {
    public static let brandeisBlue = UIColor(hex: "#0B5FF0")
    public static let doveGray =  UIColor(hex: "#636363")
    public static let codGray =  UIColor(hex: "#141414")
    public static let mediumGray =  UIColor(hex: "#8A8A8A")
    public static let tallPoppyRed =  UIColor(hex: "#AD283E")
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var cString = hex
            .filter { !$0.isWhitespace }
            .uppercased()

        if cString.hasPrefix("#") { cString.removeFirst() }

        guard cString.count == 6 else {
            self.init(hex: "ff0000") // gray color
            return
        }

        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

}
