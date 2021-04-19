import UIKit

// 通貨の説明
protocol CurrencyDescribing {
    var symbol: String { get }
    var code: String { get }
}

final class Euro: CurrencyDescribing {
    var symbol: String {
        return "€"
    }
    var code: String {
        return "EUR"
    }
}

final class UnitedStatesDolar: CurrencyDescribing {
    var symbol: String {
        return "$"
    }
    var code: String {
        return "USD"
    }
}

final class Japan: CurrencyDescribing {
    var symbol: String {
        return "￥"
    }
    
    var code: String {
        return "JP"
    }
}

enum Country {
    case unitedStates
    case spain
    case greece
    case japan
}

//返り値でパブリックを返す
struct CurrencyFactory {
    static func currency(for country: Country) -> CurrencyDescribing? {
        switch country {
        case .spain, .greece:
            return Euro()
        case .unitedStates:
            return UnitedStatesDolar()
        case .japan:
            return Japan()
        }
    }
}

//使用
let japan = CurrencyFactory.currency(for: .japan)?.code
