import Foundation
import UIKit

public extension UIFont {
    static let pretendardBoldFont = "Pretendard-Bold"
    static let pretendardExtraBoldFont = "Pretendard-ExtraBold"
    static let pretendardLightFont = "Pretendard-Light"
    static let pretendardMediumFont = "Pretendard-Medium"
    static let pretendardRegularFont = "Pretendard-Regular"
    static let pretendardSemiBoldFont = "Pretendard-SemiBold"
    
    // MARK: GNB
    class var font_gnb_title: UIFont { return .font_16_sb }
    class var font_gnb_cta: UIFont { return .font_14_sb }
    
    // MARK: Page Title
    class var font_page_title: UIFont { return .font_24_b }
    class var font_page_subtitle: UIFont { return .font_16_r }
    
    // MARK: Button & Action
    class var font_action_primary: UIFont { return .font_18_b }
    class var font_action_secondary: UIFont { return .font_16_b }
    class var font_action_tertiary: UIFont { return .font_14_b }
    
    // MARK: Badge
    class var font_badge_s: UIFont { return .font_10_b }
    
    
    // MARK: 48pt Display
    class var font_48_xb: UIFont { return .font_xb(48.0) }
    class var font_48_b: UIFont { return .font_b(48.0) }
    
    // MARK: 40pt Display
    class var font_40_xb: UIFont { return .font_xb(40.0) }
    class var font_40_b: UIFont { return .font_b(40.0) }
    
    // MARK: 32pt Display
    class var font_32_xb: UIFont { return .font_xb(32.0) }
    class var font_32_b: UIFont { return .font_b(32.0) }
    
    // MARK: 30pt Display
    class var font_30_xb: UIFont { return .font_xb(30.0) }
    class var font_30_b: UIFont { return .font_b(30.0) }
    
    // MARK: 28pt Display
    class var font_28_xb: UIFont { return .font_xb(28.0) }
    class var font_28_b: UIFont { return .font_b(28.0) }
    
    // MARK: 26pt Display
    class var font_26_xb: UIFont { return .font_xb(26.0) }
    class var font_26_b: UIFont { return .font_b(26.0) }
    
    // MARK: 24pt Display
    class var font_24_xb: UIFont { return .font_xb(24.0) }
    class var font_24_b: UIFont { return .font_b(24.0) }
    class var font_24_sb: UIFont { return .font_sb(24.0) }
    class var font_24_m: UIFont { return .font_m(24.0) }
    
    // MARK: 22pt Display
    class var font_22_xb: UIFont { return .font_xb(22.0) }
    class var font_22_b: UIFont { return .font_b(22.0) }
    class var font_22_sb: UIFont { return .font_sb(22.0) }
    class var font_22_m: UIFont { return .font_m(22.0) }
    class var font_22_r: UIFont { return .font_r(22.0) }
    
    // MARK: 20pt Display
    class var font_20_xb: UIFont { return .font_xb(20.0) }
    class var font_20_b: UIFont { return .font_b(20.0) }
    class var font_20_sb: UIFont { return .font_sb(20.0) }
    class var font_20_m: UIFont { return .font_m(20.0) }
    class var font_20_r: UIFont { return .font_r(20.0) }
    
    // MARK: 18pt Title
    class var font_18_xb: UIFont { return .font_xb(18.0) }
    class var font_18_b: UIFont { return .font_b(18.0) }
    class var font_18_sb: UIFont { return .font_sb(18.0) }
    class var font_18_m: UIFont { return .font_m(18.0) }
    class var font_18_r: UIFont { return .font_r(18.0) }
    
    // MARK: 17pt Title
    class var font_17_xb: UIFont { return .font_xb(17.0) }
    class var font_17_b: UIFont { return .font_b(17.0) }
    class var font_17_sb: UIFont { return .font_sb(17.0) }
    class var font_17_m: UIFont { return .font_m(17.0) }
    class var font_17_r: UIFont { return .font_r(17.0) }
    
    // MARK: 16pt Title
    class var font_16_xb: UIFont { return .font_xb(16.0) }
    class var font_16_b: UIFont { return .font_b(16.0) }
    class var font_16_sb: UIFont { return .font_sb(16.0) }
    class var font_16_m: UIFont { return .font_m(16.0) }
    class var font_16_r: UIFont { return .font_r(16.0) }
    class var font_16_l: UIFont { return .font_l(16.0) }
    
    // MARK: 15pt Title & Body
    class var font_15_xb: UIFont { return .font_xb(15.0) }
    class var font_15_b: UIFont { return .font_b(15.0) }
    class var font_15_sb: UIFont { return .font_sb(15.0) }
    class var font_15_m: UIFont { return .font_m(15.0) }
    class var font_15_r: UIFont { return .font_r(15.0) }
    
    // MARK: 14pt Body
    class var font_14_xb: UIFont { return .font_xb(14.0) }
    class var font_14_b: UIFont { return .font_b(14.0) }
    class var font_14_sb: UIFont { return .font_sb(14.0) }
    class var font_14_m: UIFont { return .font_m(14.0) }
    class var font_14_r: UIFont { return .font_r(14.0) }
    
    // MARK: 13pt Body & Caption
    class var font_13_b: UIFont { return .font_b(13.0) }
    class var font_13_sb: UIFont { return .font_sb(13.0) }
    class var font_13_m: UIFont { return .font_m(13.0) }
    class var font_13_r: UIFont { return .font_r(13.0) }
    class var font_13_xb: UIFont { return .font_xb(13.0) }
    
    // MARK: 12pt Caption
    class var font_12_xb: UIFont { return .font_xb(12.0) }
    class var font_12_b: UIFont { return .font_b(12.0) }
    class var font_12_sb: UIFont { return .font_sb(12.0) }
    class var font_12_m: UIFont { return .font_m(12.0) }
    class var font_12_r: UIFont { return .font_r(12.0) }
    
    // MARK: 11pt Caption
    class var font_11_xb: UIFont { return .font_xb(11.0) }
    class var font_11_b: UIFont { return .font_b(11.0) }
    class var font_11_sb: UIFont { return .font_sb(11.0) }
    class var font_11_m: UIFont { return .font_m(11.0) }
    class var font_11_r: UIFont { return .font_r(11.0) }
    
    // MARK: 10pt Caption
    class var font_10_xb: UIFont { return .font_xb(10.0) }
    class var font_10_b: UIFont { return .font_b(10.0) }
    class var font_10_sb: UIFont { return .font_sb(10.0) }
    class var font_10_m: UIFont { return .font_m(10.0) }
    class var font_10_r: UIFont { return .font_r(10.0) }
    
    // MARK: 9pt Caption
    class var font_9_b: UIFont { return .font_b(9.0) }
    class var font_9_sb: UIFont { return .font_sb(9.0) }
    class var font_9_m: UIFont { return .font_m(9.0) }
    
    // MARK: 폰트 - Heavy
    class func font_xb(_ size: CGFloat) -> UIFont {
        return getDefaultFont(size, weight: .heavy)
    }
    
    // MARK: 폰트 - SemiBold
    class func font_sb(_ size: CGFloat) -> UIFont {
        return getDefaultFont(size, weight: .semibold)
    }
    
    // MARK: 폰트 - Bold
    class func font_b(_ size: CGFloat) -> UIFont {
        return getDefaultFont(size, weight: .bold)
    }
    
    // MARK: 폰트 - Medium
    class func font_m(_ size: CGFloat) -> UIFont {
        return getDefaultFont(size, weight: .medium)
    }
    
    // MARK: 폰트 - Regular
    class func font_r(_ size: CGFloat) -> UIFont {
        return getDefaultFont(size, weight: .regular)
    }
    
    // MARK: 폰트 - Light
    class func font_l(_ size: CGFloat) -> UIFont {
        return getDefaultFont(size, weight: .light)
    }
    
    //폰트 https://cactus.tistory.com/306
    class func getDefaultFont(_ size: CGFloat, weight: UIFont.Weight) -> UIFont {
        let defaultFont = UIFont.systemFont(ofSize: size, weight: weight)
        switch weight {
        case .regular:
            return UIFont(name: UIFont.pretendardRegularFont, size: size) ?? defaultFont
        case .bold:
            return UIFont(name: UIFont.pretendardBoldFont, size: size) ?? defaultFont
        case .semibold:
            return UIFont(name: UIFont.pretendardSemiBoldFont, size: size) ?? defaultFont
        case .heavy:
            return UIFont(name: UIFont.pretendardExtraBoldFont, size: size) ?? defaultFont
        case .light:
            return UIFont(name: UIFont.pretendardLightFont, size: size) ?? defaultFont
        case .medium:
            return UIFont(name: UIFont.pretendardMediumFont, size: size) ?? defaultFont
        default:
            return UIFont.systemFont(ofSize: size, weight: weight)
        }
    }
    
}

