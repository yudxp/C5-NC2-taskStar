//
//  CircularProgressBar.swift
//  Focus Star
//
//  Created by Yudha Hamdi Arzi on 26/07/22.
//

import SwiftUI

struct CircularProgressBar: View {
  @State var circleProgress: CGFloat = 0.0
  @State var progressStatus: Bool = false
  
    var body: some View {
      VStack {
        ZStack{
          Circle()
            .trim(from: 0.0, to: circleProgress)
            .stroke(Color.blue, lineWidth: 15)
            .frame(width: 200, height: 200)
            .rotationEffect(Angle(degrees: -90))
          Text("\(Int(self.circleProgress*100))%")
            .font(.custom("HelveticaNeue", size: 20.0))
        }
        Button(action: {self.startLoading()}){
          if progressStatus {
            Image(systemName: "pause.circle")
              .resizable()
              .frame(width: 60, height: 60)
          }
          else {
              Image(systemName: "play.circle")
                .resizable()
                .frame(width: 60, height: 60)
          }
        }
        .padding()
      }
    }

    func startLoading() {
      progressStatus.toggle()
      _ = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in withAnimation() {
        if progressStatus {
          self.circleProgress += 0.01
        } else {
          timer.invalidate()
        }
        if self.circleProgress >= 1.0 {
          timer.invalidate()
          circleProgress = 0.0
          progressStatus = false
        }
        }
      }
    }
}

struct CircularProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressBar()
    }
}
