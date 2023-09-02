//
//  ContentView.swift
//  TimerProject
//
//  Created by Shomil Singh on 03/09/23.
//

import SwiftUI

struct ContentView: View {
    @State private var countDownTimer = 5
    @State private var timerRunning = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        VStack {
            Text("\(countDownTimer)")
                .onReceive(timer){ _ in
                    if(countDownTimer > 0 && timerRunning)
                    {
                        countDownTimer-=1
                    }
                    else{
                        timerRunning=false
                    }
                }
                .font(.system(size: 90,weight: .bold))
            HStack{
                Button("Start"){
                    timerRunning=true
                }
                
                Button("Reset")
                {
                    countDownTimer=5
                }
                .foregroundColor(.red)
            }
           
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
