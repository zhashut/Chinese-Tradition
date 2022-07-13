//
//  PoetryGameRow.swift
//  CFestival
//
//  Created by 李婉玲 on 2022/7/7.
//

import SwiftUI

struct PoetryGameRow: View {
    var poetry: Poetry
    
    var body: some View {
        HStack {
            HStack {
                VStack(alignment: .leading, spacing: 12.0) {
                    Text(poetry.poetryName)
                        .font(.title2)
                        .strockeStyleline()
                    
                    Text(poetry.poetryWriter)
                        .font(.subheadline)
                        .foregroundColor(.primary)
                }
                
                if poetry.isVictory {
                    Text("😊")
                        .offset(y: -15)
                }
            }
            
            
            Spacer()
            
            Image(systemName: "chevron.right")
              .font(.system(size: 13))
              .foregroundColor(.secondary)
              .offset(x: 15)
        }
        .padding()
    }
}

struct PoetryGameRow_Previews: PreviewProvider {
    static var previews: some View {
        PoetryGameRow(poetry: poetryData[0])
            .environmentObject(ModelData())
    }
}
