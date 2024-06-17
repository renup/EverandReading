//
//  ErrorView.swift
//  EverandReading
//
//  Created by Renu Punjabi on 6/16/24.
//

import SwiftUI

struct ErrorView: View {
    let retryClosure: () -> Void?
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            HStack(spacing: 8) {
                Image(systemName: "exclamationmark.triangle")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.yellow)

                Text("Error")
                    .font(.largeTitle).bold()
            }
            
            Text("Something went wrong!")
                .font(.title)
            Text("Try again later")
                .font(.title)
                .padding(.bottom, 10)
            
            Button {
                retryClosure()
            } label: {
                Text("Retry")
                    .font(.title).bold()
                    .padding()
                    .foregroundColor(.primary)
                    .background(.blue)
                    .cornerRadius(10)
            }

        }
        .foregroundColor(.primary)

    }
}

#Preview {
    ErrorView(retryClosure: {} )
}
