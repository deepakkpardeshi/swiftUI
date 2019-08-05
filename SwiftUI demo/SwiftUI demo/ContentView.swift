//
//  ContentView.swift
//  SwiftUI demo
//
//  Created by Deepak Pardeshi on 8/2/19.
//  Copyright © 2019 Deepak Padeshi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var name: String = "dp"
    @State var pwd: String = ""
    @State var showAlert: Bool = false
    @State var isPresented = false

    var body: some View {
        
        NavigationView {
            
            
        VStack(alignment: .leading){
            Image("host").cornerRadius(20.0).frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            
            Text("Email")
            TextField("email", text: $name).textFieldStyle(.roundedBorder)
                .padding(10.0)
            Text("Password")
            TextField("Password", text: $pwd).textFieldStyle(.roundedBorder)
                .padding(10.0)
            
            
            NavigationLink(destination: DetailsView()) {
                   Text("LOGIN")
                .background(Color.yellow)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(20)
                 }
                

            
            Button(action: { self.isPresented.toggle() }) {
                Text("By logging in, you’re agreeing to the Terms & Conditions")
            }.sheet(isPresented: $isPresented, content: { ModalView() })
            .padding()
            .cornerRadius(10.0)
            .shadow(radius: 10.0)

            
        }
        .navigationBarTitle("SwiftUI")
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .background(Color.init(hex: "ace28d"))
        }
    }
    
    func loginCheck() -> Bool {
        return true;
    }

}

struct DetailsView: View {

    var body: some View {
        VStack(alignment: .leading){
            Text("Details screen")
                .font(.largeTitle)
            
            
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .background(Color.init(hex: "ace28d"))
    }
}

struct ModalView: View {
    
    var body: some View {
            WebView(request: URLRequest(url: URL(string: "https://www.apple.com/")!))
    }
}
import WebKit

struct WebView : UIViewRepresentable {
      
    let request: URLRequest
      
    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView()
    }
      
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
      
}

#if DEBUG
struct WebView_Previews : PreviewProvider {
    static var previews: some View {
        WebView(request: URLRequest(url: URL(string: "https://www.apple.com")!))
    }
}
#endif

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff


        self.init(red: Double(r) / 0xff, green: Double(g) / 0xff, blue: Double(b) / 0xff)

    }
}
