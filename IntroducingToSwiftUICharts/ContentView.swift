//
//  ContentView.swift
//  IntroducingToSwiftUICharts
//
//  Created by Ramill Ibragimov on 07.09.2022.
//

import SwiftUI
import Charts

enum AccountType: String {
    case checking = "Checking"
    case savings = "Savings"
    case brokerage = "Brokerage"
    case retirement = "Retirement"
}

struct Account: Identifiable {
    let id = UUID()
    let accountType: AccountType
    let balance: Double
}

struct ContentView: View {
    
    let accounts = [
        Account(accountType: .checking, balance: 4500),
        Account(accountType: .savings, balance: 8000),
        Account(accountType: .retirement, balance: 14500),
        Account(accountType: .brokerage, balance: 6500),
    ]
    
    var body: some View {
        Chart {
            ForEach(accounts) { account in
                BarMark(x: .value("Account Type", account.accountType.rawValue), y: .value("Balance", account.balance))
                    .foregroundStyle(by: .value("Account Type", account.accountType.rawValue))
            }
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
