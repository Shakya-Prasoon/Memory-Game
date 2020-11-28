//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Prasoon Shakya on 11/27/20.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack{
            Grid(viewModel.cards){ card in
                CardView(card: card).onTapgesture{
                    withAnimation(.linear(duration: 2)){
                        self.viewModel.choose(card: card)
                    }
                }
                .padding(5)
            }
                .padding()
                .foregroundColor(Color.orange)
            Button(action: {
                withAnimation(.easeInOut(duration: 2)){
                    self.viewModel.resetgame()
                }
            }, label: {Text("New game") })
        }
    }
}

struct CardView: View {
    var card: MemoryGane<String>.Card
    
    var body: some View {
        GeometryReader{ geoetry in
            self.body(for: geometry.size)
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(110-90), clockwise: true)
                    .padding(5).opacity(0.4)
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                    .animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: flase) : .default)
            }
            .cardify(isFaceUp: card.isFaceUp)
            .transition(AnyTransition.scale)
            .rotation3DEffect(Angle.degrees(card.isFaceUp ? 0 : 180), axis: (0, 1, 0))
        }
    }
    
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.7
    }
    
    
}




struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView()
    }
}
