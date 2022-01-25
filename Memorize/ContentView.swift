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
	var emojis = ["🐶","🐱","🐭","🐰" ]
	@State var emojiCount = 6
	var body: some View {
		VStack {
			HStack {
				ForEach(emojis, id: \.self) { emoji in
					CardView(content: emoji)
				}
			}
			HStack {
				remove
				Spacer()
				add
			}
			.padding(.horizontal)
		}
		.padding(.horizontal)
		.foregroundColor(.red) // Zstack의 defalut
	}
	var remove: some View {
		// Button label 은 함수이다 (뷰 빌더 그래서 뷰의 결합으로 복잡한 뷰 표현 가능.)
		Button(action: {
			emojiCount -= 1
		}, label: {
			VStack {
				Text("Remove")
				Text("Card")
			}
		})
	}
	var add: some View {
		Button(action: {
			emojiCount += 1
		}, label: {
			VStack {
				Text("Add")
				Text("Card")
			}
		})
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
				shape.stroke(lineWidth: 3)
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
			ContentView()
				.preferredColorScheme(.light)
		}
}
