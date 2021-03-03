//
//  ContentView.swift
//  Autenticazione
//
//  Created by Michele Manniello on 03/03/21.
//

import SwiftUI
import LocalAuthentication

var screen = NSScreen.main!.visibleFrame
struct ContentView: View {
    @State var successo : Bool = false
    var body: some View {
        HStack(alignment: .center) {
            if successo{
                Text("Benvenuto")
                .padding()
            }
           
        }.onAppear{
            autenticationUser()
        }
        .ignoresSafeArea(.all,edges: .all)
        .frame(minWidth: 700, idealWidth: screen.width / 1.2, maxWidth: .infinity, minHeight: 600, idealHeight: screen.height - 60, maxHeight: .infinity)
    }
    func autenticationUser(){
        let cotext = LAContext()
        var error : NSError?
        if cotext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            let reason = "Login"
            cotext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { (succes, error) in
                if succes {
                    self.successo.toggle()
                }else{
                    print(error?.localizedDescription)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
