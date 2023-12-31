//
//  CardView.swift
//  Scrumdinger
//  todo-anlythree 黄色背景色还是没出来，don‘t know why
//  Created by anlythree on 2023/9/17.
//

import SwiftUI

struct CardView: View {
    let scrum: DailyScrum
    var body: some View {
        VStack(alignment: .leading) {
            Text(scrum.title)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            Spacer()
            HStack {
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                    .accessibilityLabel("\(scrum.attendees.count) attendees")
                Spacer()
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                    .accessibilityLabel("\(scrum.lengthInMinutes) minute meeting")
                    .labelStyle(.trailingIcon)
            }
            .font(.caption)
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
        .background(scrum.theme.mainColor)
    }
}

// PreviewProvider 是一种用于生成预览的协议
struct CardView_Previews: PreviewProvider {
    static var scrum = DailyScrum(title: "Design",
                                  attendees: ["Cathy", "Daisy", "Simon", "Jonathan"],
                                  lengthInMinutes: 10,
                                  theme: .yellow)
    static var previews: some View {
        CardView(scrum: scrum)
            .background(scrum.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
