//
//  InvoiceView.swift
//  InvoiceUI
//
//  Created by Darien Sandifer on 8/12/21.
//

import SwiftUI

struct InvoiceView: View {
    let items: [LineItem] = [
        LineItem(quantity: 4, name: "fixed washing machine", amount: 1200.0, quantityType: "hours"),
        LineItem(quantity: 2, name: "mowed lawn", amount: 100.0, quantityType: "hours"),
        LineItem(quantity: 20, name: "created website", amount: 1200.0, quantityType: "hours"),
        LineItem(quantity: 3, name: "patrolled campsite", amount: 300.0, quantityType: "days"),
        LineItem(quantity: 4, name: "housekeeping services", amount: 1200.0, quantityType: "hours"),
        LineItem(quantity: 2, name: "fixed computer", amount: 200.0, quantityType: "hours"),
        LineItem(quantity: 6, name: "babysitting", amount: 250.0, quantityType: "hours"),
        LineItem(quantity: 6, name: "painted fencing", amount: 150.0, quantityType: "hours"),
        LineItem(quantity: 2, name: "siding for house", amount: 1400.0, quantityType: "days"),
        LineItem(quantity: 1, name: "callibrated television", amount: 50.0, quantityType: "hours"),
    ]
    
    var myDivider: some View{
        Divider()
            .background(Color.white)
            
    }
    
    var dashedDivider: some View{
        Divider()
            .opacity(0)
            .overlay(Rectangle().stroke(style: StrokeStyle(lineWidth: 0.6, dash: [1.5])))
    }
    var topHeading: some View{
        HStack{
            VStack(alignment: .leading){
                Text("Company Intl., LLC")
                    .fontWeight(.thin)
                    .font(.title)
                
                Text("companywebsite.com")
                    .fontWeight(.heavy)
                    .font(.system(size: 8))
            }
            Spacer()
        }
    }
    
    var clientInformation: some View{
        HStack{
            VStack(alignment: .leading){
                Text("To: Client Name")
                    .fontWeight(.light)
                Text("client@dudesemail.com")
                    .fontWeight(.heavy)
            }
            
            Spacer()
            VStack(alignment: .trailing){
                Text("Invoice: #8675309")
                    .fontWeight(.light)
                Text("companywebsite.com")
                    .fontWeight(.heavy)
            }
        }
    }
    
    var workCompleted: some View{
        VStack(spacing: 18){
            Text("Work Completed")
                .fontWeight(.light)
                .font(.system(size: 7).lowercaseSmallCaps())
                .padding([.vertical,.horizontal], 3.5)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(lineWidth: 0.5)
                )

            VStack{
                ForEach(items){ item in
                    LineItemView(item: item)

                    myDivider
                        .opacity(0.4)
                }
            }
        }
    }
    
    var paymentArea: some View{
        VStack(spacing: 20){
            Text("total: $10000")
                .fontWeight(.heavy)
            
            payNowbtn
        }
        .font(.title3.smallCaps())
        .foregroundColor(.white.opacity(0.8))
    }
    
    var payNowbtn: some View{
        Button(action: {}, label: {
            Text("Pay Now")
                .foregroundColor(Color("Blue300"))
                .fontWeight(.heavy)
                
        })
        .frame(width: 100, height: 30, alignment: .center)
        .background(Color.white)
        .cornerRadius(20)
    }
    
    
    var body: some View {
        GeometryReader{ geo in
            ZStack{
                Color("Blue300")
                VStack(spacing: 4){
                    Group{
                        Spacer()
                        topHeading
                        Spacer()
                        dashedDivider
                        Spacer()
                    }
                    
                    Group{
                        clientInformation
                            .font(.system(size: 10))
                        
                        Spacer()
                        myDivider
                        Spacer()
                    }
                    
                    Group{
                        workCompleted
                        
                        Spacer()
                        myDivider
                        
                        paymentArea
                        Spacer()
                    }
                }
                .frame(maxWidth: 600, maxHeight: 800)
                .padding(.horizontal, 10)
                .padding(.vertical, -20)
                .background(
                    geo.size.width < 800 ?
                        Color.black.opacity(0).cornerRadius(0)
                        :Color.black.opacity(0.1).cornerRadius(25)
                )
            }
        }
        .statusBar(hidden: true)
        .edgesIgnoringSafeArea(.all)
        .foregroundColor(.white.opacity(0.8))
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        InvoiceView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            .previewDisplayName("iPhone 8")
        InvoiceView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
            .previewDisplayName("iPhone 11 Pro Max")
        InvoiceView()
            .previewDevice(PreviewDevice(rawValue: "IPad Air 4th generation"))
            .previewDisplayName("IPad Air (4th generation)")
    }
}
