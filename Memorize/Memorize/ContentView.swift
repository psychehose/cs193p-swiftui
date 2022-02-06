//
//  ContentView.swift
//  Memorize
//
//  Created by 호세김 on 2021/12/22.
//

import SwiftUI

/*
 Zstack도 일종의 some View 다.
 body: Zstack
 content는 call function -> View Builder
 SU는 뷰의 결합으로 하는 게 패러다임에 맞음
*/


struct ContentView: View {
	var emojis = ["🐶","🐱","🐭","🐰","🐻‍❄️","🐨","🦆","🐴","🐠","🌱","🌿","☘️","🍀","🎍","🎋","🍃","🌷","💐","🪨","🐚,","🍄","🍁","🌹","🥀","🌺" ]
	@State var emojiCount = 6
	var body: some View {
		VStack {
			ScrollView {
				LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
					ForEach(emojis[0 ..< emojiCount], id: \.self) { emoji in
						CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
					}
				}
			}
			.foregroundColor(.red) // Zstack의 defalut
			Spacer()
			HStack {
				remove
				Spacer()
				add
			}
			.font(.largeTitle)
			.padding(.horizontal)
		}
		.padding(.horizontal)
	}
	var remove: some View {
		// Button label 은 함수이다 (뷰 빌더 그래서 뷰의 결합으로 복잡한 뷰 표현 가능.)
		Button {
			if emojiCount > 1 {
				emojiCount -= 1
			}
		} label: {
			Image(systemName: "minus.circle")
		}
	}
	var add: some View {
		Button {
			if emojiCount < emojis.count {
				emojiCount += 1
			}
		} label: {
			Image(systemName: "plus.circle")
		}
	}
}
struct CardView: View {

	@State var isFaceUp: Bool = true
	var content: String
	
	var body: some View {
		ZStack {
			let shape = RoundedRectangle(cornerRadius: 20)
			
			if isFaceUp {
				shape.fill().foregroundColor(.white)
				shape.strokeBorder(lineWidth: 3)
				Text(content).font(.largeTitle)
			} else {
				shape.fill()
			}
		}
		.onTapGesture {
			isFaceUp = !isFaceUp
		}
	}
}

	// MARK: - 프리뷰 커스텀
struct ContentView_Previews: PreviewProvider {
		static var previews: some View {
			ContentView()
				.preferredColorScheme(.dark)
.previewInterfaceOrientation(.portrait)
			ContentView()
				.preferredColorScheme(.light)
		}
}
