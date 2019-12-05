import Foundation

public class CardValidator: NSObject {
    
    @objc
    public func isValid(_ number: String) -> Bool {
        do {
            try validate(number)
        } catch {
            print(error.localizedDescription)
            return false
        }
        
        return true
    }
    
    @objc
    public func validate(_ number: String) throws {
        guard let cardNumber = number.numbersOnly else {
            throw CardError.notNumeric
        }
        
        guard cardNumber.first != "0" else {
            throw CardError.leadingZero
        }
        
        guard (12...19).contains(cardNumber.count) else {
            throw CardError.invalidLength
        }
        
        guard luhnCheck(cardNumber) else {
            throw CardError.invalid
        }
    }
    
    // Luhn algorithm check. Implementation of https://en.wikipedia.org/wiki/Luhn_algorithm
    @objc
    public func luhnCheck(_ number: String) -> Bool {
        let nDigits = number.count
        var digits = number.compactMap { Int(String($0)) }
        guard digits.count == nDigits else { return false }
        guard var sum = digits.last else { return false }
        digits = digits.dropLast()
        
        let parity = nDigits % 2

        for (idx, var digit) in digits.enumerated() {
            if idx % 2 == parity { digit *= 2 }
            if digit > 9 { digit -= 9 }
            sum += digit
        }
        return (sum % 10) == 0
    }
    
    public func filter(list cards: [CreditCard], validity: CardValidity = .any, network: CardType = .unknown) -> [CreditCard] {
        var filtredCards = cards
        
        if validity != .any {
            filtredCards = filtredCards.filter { $0.isValid == Bool(truncating: NSNumber(value: validity.rawValue)) }
        }
        
        if network != .unknown {
            filtredCards = filtredCards.filter { $0.network == network }
        }
        
        return filtredCards
    }
    
    @objc
    public func filter(list cardNumbers: [String], validity: CardValidity = .any, network: CardType = .unknown) -> [CreditCard] {
        let cards = cardNumbers.compactMap { CreditCard($0) }
        
        return filter(list: cards, validity: validity, network: network)
    }
    
    public func getCardInfo(for number: String, _ completion: @escaping (Result<CardInfo, Error>)->Void) {
        guard let url = URL(string: "https://lookup.binlist.net/\(number.getNumbersOnly())") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                completion(.failure(CardError.unsupported))
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 404 {
                    completion(.failure(CardError.unsupported)) 
                    return
                }
            }
            
            if let info = data.to(CardInfo.self) {
                completion(.success(info))
            } else {
                completion(.failure(CardError.unsupported))
            }
        }
        
        task.resume()
    }
    
    // Obj-C Wrapper for getCardInfo(for: _:) method
    @objc
    public func getCardInfo(forNumber: String, completionHandler: @escaping (CardInfo?)->Void) {
        self.getCardInfo(for: forNumber) { result in
            switch result {
            case .success(let info): completionHandler(info)
            case .failure: completionHandler(nil)
            }
        }
    }
}
