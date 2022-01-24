//
//  ContentView.swift
//  Memorize
//
//  Created by 호세김 on 2021/12/22.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
			HStack {
				CardView()
				CardView()
				CardView()
				CardView()
			}
				.padding(.horizontal)
				.foregroundColor(.red) // Zstack의 defalut

    }
}
 
/*
 
Zstack도 일종의 some View 다.
body: Zstack
content는 call function -> View Builder
 
 
 
 */
 // SU는 뷰의 결합으로 하는 게 패러다임에 맞음
struct CardView: View {
	var isFaceUp: Bool = true

	var body: some View {
		ZStack {
			let shape = RoundedRectangle(cornerRadius: 20)
			
			if isFaceUp {
				shape.fill().foregroundColor(.white)
				shape.stroke(lineWidth: 3)
				Text("⚽️").font(.largeTitle)
			} else {
				shape.fill()
			}
		}
	}
}











	// MARK: - 프리뷰 커스텀
struct ContentView_Previews: PreviewProvider {
		static var previews: some View {
			ContentView()
				.preferredColorScheme(.dark
				) // View Modifier
			ContentView()
				.preferredColorScheme(.light) // View Modifier
		}
}
