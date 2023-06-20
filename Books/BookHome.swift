//
//  BookHome.swift
//  Boss5207418
//
//  Created by Rachelle Ford on 6/13/23.
//

import SwiftUI

struct BookHome: View {
    
    @State private var activeTag: String = ""
    @State private var carouselMode: Bool = false
    /// For Matched Geometry Effect
    @Namespace private var animation
    /// Detail View Properties
    @State private var showBookDetailView: Bool = false
    @State private var selectedBook: Book?
    @State private var animateCurrentBook: Bool = false
    
    
    var body: some View {
        VStack(spacing: 15) {
            ZStack(alignment: .topLeading) {
                Image("bannerbooks")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
              //      .frame(height: 100)
                //    .padding(.horizontal)
                
                VStack(spacing: 10) {
                    Text("")
                        .font(.largeTitle.bold())
                    
                    Text("")
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                }
                .padding(.top, 110)
                .padding(.horizontal)
                
                HStack {
                    Spacer()
                    
                    Menu {
                        Button("Toggle Carousel Mode (\(carouselMode ? "On" : "Off"))") {
                            carouselMode.toggle()
                        }
                    } label: {
                        Image(systemName: "ellipsis")
                            .rotationEffect(.init(degrees: -90))
                            .foregroundColor(.gray)
                            .frame(width: 40, height: 40)
                            .contentShape(Rectangle())
                    }
                }
                .padding(.horizontal)
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
                
        
            
            TagsView()
            
            GeometryReader {
                let size = $0.size
                
                ScrollView(.vertical, showsIndicators: false) {
                    /// Books Card View
                    VStack(spacing: 35) {
                        ForEach(sampleBooks) { book in
                            BookCardView(book)
                                /// Opening Detail View, When Ever Card is Tapped
                                .onTapGesture {
                                    withAnimation(.easeInOut(duration: 0.2)) {
                                        animateCurrentBook = true
                                        selectedBook = book
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                                        withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                                            showBookDetailView = true
                                        }
                                    }
                                }
                        }
                    }
                    .padding(.horizontal, 15)
                    .padding(.vertical, 20)
                    .padding(.bottom, bottomPadding(size))
                    .background {
                        ScrollViewDetector(carouselMode: $carouselMode, totalCardCount: sampleBooks.count)
                    }
                }
                /// Since we need offset from here and not from global View
                .coordinateSpace(name: "SCROLLVIEW")
            }
            .padding(.top, 15)
        }
        .overlay {
            if let selectedBook, showBookDetailView {
                BookDetailView(show: $showBookDetailView, animation: animation, book: selectedBook)
                /// For More Fluent Animation Transition
                    .transition(.asymmetric(insertion: .identity, removal: .offset(y: 5)))
            }
        }
        .onChange(of: showBookDetailView) { newValue in
            if !newValue {
                /// Resetting Book Animation
                withAnimation(.easeInOut(duration: 0.15).delay(0.4)) {
                    animateCurrentBook = false
                }
            }
        }
    }
    
    /// Bottom Padding for last card to move up to the top
    func bottomPadding(_ size: CGSize = .zero) -> CGFloat {
        let cardHeight: CGFloat = 220
        let scrollViewHeight: CGFloat = size.height
        
        return scrollViewHeight - cardHeight - 40
    }
    
    /// Book Card View
    @ViewBuilder
    func BookCardView(_ book: Book) -> some View {
        GeometryReader {
            let size = $0.size
            let rect = $0.frame(in: .named("SCROLLVIEW"))
            
            HStack(spacing: -25) {
                /// Book Detail Card
                /// Placing this card above the cover image
                VStack(alignment: .leading, spacing: 6) {
                    Text(book.title)
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    Text("By \(book.author)")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    /// Rating View
                    RatingView(rating: book.rating)
                        .padding(.top, 10)
                    
                    Spacer(minLength: 10)
                    
                    HStack(spacing: 4) {
                        Text("\(book.bookViews)")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                        
                        Text("Views")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        Spacer(minLength: 0)
                        
                        Image(systemName: "chevron.right")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                .padding(20)
                .frame(width: size.width / 2, height: size.height * 0.8)
                .background {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(.white)
                        /// Applying Shadow
                        .shadow(color: .black.opacity(0.08), radius: 8, x: 5, y: 5)
                        .shadow(color: .black.opacity(0.08), radius: 8, x: -5, y: -5)
                }
                .zIndex(1)
                /// Moving the book, it it's tapped
                .offset(x: animateCurrentBook && selectedBook?.id == book.id ? -20 : 0)
                
                /// Book Cover Image
                ZStack {
                    if !(showBookDetailView && selectedBook?.id == book.id) {
                        Image(book.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: size.width / 2, height: size.height)
                            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                            /// Matched Geometry ID
                            .matchedGeometryEffect(id: book.id, in: animation)
                            /// Applying Shadow
                            .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                            .shadow(color: .black.opacity(0.1), radius: 5, x: -5, y: -5)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(width: size.width)
            .rotation3DEffect(.init(degrees: convertOffsetToRotation(rect)), axis: (x: 1, y: 0, z: 0), anchor: .bottom, anchorZ: 1, perspective: 0.8)
        }
        .frame(height: 220)
    }
    
    /// Converting MinY to Rotation
    func convertOffsetToRotation(_ rect: CGRect) -> CGFloat {
        let cardHeight = rect.height + 20
        let minY = rect.minY - 20
        let progress = minY < 0 ? (minY / cardHeight) : 0
        let constrainedProgress = min(-progress, 1.0)
        return constrainedProgress * 90
    }
    
    /// Tags View
    @ViewBuilder
    func TagsView() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(tags, id: \.self) { tag in
                    Text(tag)
                        .font(.caption)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 5)
                        .background {
                            if activeTag == tag {
                                Capsule()
                                    .fill(Color("Blue"))
                                    .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                            } else {
                                Capsule()
                                    .fill(.gray.opacity(0.2))
                            }
                        }
                        .foregroundColor(activeTag == tag ? .white : .gray)
                        /// Changing Active Tag when tapped one of the tag
                        .onTapGesture {
                            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.7, blendDuration: 0.7)) {
                                activeTag = tag
                            }
                        }
                }
            }
            .padding(.horizontal, 15)
        }
    }
}

/// Sample Tags
var tags: [String] = [
    "Relationships", "Fiction", "Self-Love", "Children", "Business", "Non-Fiction", "Young Authors"
]
