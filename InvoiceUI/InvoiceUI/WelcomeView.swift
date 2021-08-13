//
//  WelcomeView.swift
//  InvoiceUI
//
//  Created by Darien Sandifer on 8/12/21.
//

import SwiftUI

struct WelcomeView: View {
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
                Text("Gatewai, LLC")
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
    
    var lineItem: some View{
        HStack(alignment: .center, spacing: 20){
            Text("Fixed Washing machine")
                .fontWeight(.light)
                .multilineTextAlignment(.leading)
                .lineLimit(3)
                .truncationMode(.tail)
            
            Text("5 hours")
                .fontWeight(.light)
                .foregroundColor(Color("Blue300"))
                .background(RoundedRectangle(cornerRadius: 25.0).frame(minWidth: 50, minHeight: 12, alignment: .center)
                )
            
            Spacer()
            
            Text("$100.23")
                .fontWeight(.heavy)
        }
        .font(.system(size: 10))

    }
    
    var workCompleted: some View{
        Group{
            Text("Work Completed".uppercased())
                .fontWeight(.light)
                .font(.system(size: 7))
                .padding([.vertical,.horizontal], 3.5)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(lineWidth: 0.5)
                )
            
            Spacer()

            ForEach(0...10, id:\.self){ item in
                lineItem
                myDivider
                    .opacity(0.4)
            }
        }
    }
    
    var paymentArea: some View{
        VStack(spacing: 20){
            Text("total: $10000")
                .fontWeight(.heavy)

            payNowbtn
        }
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
        .edgesIgnoringSafeArea(.all)
        .foregroundColor(.white.opacity(0.8))
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            .previewDisplayName("iPhone 8")
        WelcomeView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
            .previewDisplayName("iPhone 11 Pro Max")
        WelcomeView()
            .previewDevice(PreviewDevice(rawValue: "IPad Air 4th generation"))
            .previewDisplayName("IPad Air (4th generation)")
    }
}
