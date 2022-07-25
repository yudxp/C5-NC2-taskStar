//
//  TargetView.swift
//  Focus Star
//
//  Created by Yudha Hamdi Arzi on 21/07/22.
//

import SwiftUI

struct TargetView: View {
  @Environment(\.dismiss) var dismiss

   var body: some View {
       ZStack {
         HStack {
           Text("Close")
           Button {
             dismiss()
            } label: {
                Image(systemName: "xmark.circle")
                  .font(.largeTitle)
                  .foregroundColor(.gray)
          }
         }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        .padding()
   }
}

struct TargetView_Previews: PreviewProvider {
    static var previews: some View {
        TargetView()
    }
}
