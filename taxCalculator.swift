//Made by NihalN
import SwiftUI
 
struct ContentView: View {
    
    @State private var amt = ""
    
    var purchasedAmtt: Double {
        let salesPriceUI = Double(amt) ?? 0
        return salesPriceUI
    }
    
    
    var stateTaxMethod: Double {
        let stateTaxInput = Double(amt) ?? 0
        return stateTaxInput * 0.07  //NJ Sales Tax amt
        
    }
    
    //Local tax brackets
    var localOptionUI: Double{
        let salesPriceLO = Double(amt) ?? 0
        if salesPriceLO > 1599 {
            return 44.00
        }
        if salesPriceLO < 1600 {
            return salesPriceLO * 0.0275
        }
        return salesPriceLO.self
    }
    
    var singleArticleMethod: Double {
        let salesPriceSA = Double(amt) ?? 0
        if salesPriceSA > 3200.00 {
            return 44.00
        }
        if salesPriceSA < 1600.00 {
            return 0.00
        }
        if salesPriceSA > 1600.00 && salesPriceSA < 3200.01 {
            return (salesPriceSA - 1600) * 0.0275
        }
        return salesPriceSA.self
    }
        
    
    
    
    var body: some View {
        Form{
            Section {
                TextField("Sales Price", text:$amt).keyboardType(.decimalPad)
            }
            Section{
                Text("Local Tax: $\(localOptionUI, specifier: "%.2F")")
            }
            Section{
                Text("Single Article Tax: $\(singleArticleMethod, specifier: "%.2F")")
            }
            Section {
                Text("State Tax: $\(stateTaxMethod, specifier: "%.2F")")
            }
            Section {
                Text("Total Sales Tax: $\(stateTaxMethod + singleArticleMethod + localOptionUI, specifier: "%.2F")")
            }
            Section {
                Text("Total Price: $\(purchasedAmtt + stateTaxMethod + singleArticleMethod + localOptionUI, specifier: "%.2F") ")
            }
        
        }
    }
}
 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}