//
//  WidgetAppExtention.swift
//  WidgetAppExtention
//
//  Created by Arvind on 17/11/20.
//

import WidgetKit
import SwiftUI
import Intents


struct Provider: TimelineProvider {
    
    let imageProvider: ImageProvider = ImageProvider()
    typealias Entry = SimpleEntry
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), image: UIImage(named: "test"))
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
        let entry = SimpleEntry(date: Date(), image:  UIImage(named: "test"))
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> Void) {
        let currentDate = Date()
        imageProvider.getImage { (image) in
            let entry = SimpleEntry(date: currentDate, image: image)
            let refreshDate = Calendar.current.date(byAdding: .second, value: 1, to: currentDate)!
            let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
            completion(timeline)
        }
    }
}
struct WidgetAppExtentionEntryView : View {
    
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var family
    
    @ViewBuilder
    var body: some View {
        switch family {
        case .systemSmall:
            WidgetView(_entry: (entry.image ?? UIImage(named: "test"))!)
        case .systemMedium:
            WidgetView(_entry: (entry.image ?? UIImage(named: "test"))!)
        case .systemLarge:
            WidgetView(_entry: (entry.image ?? UIImage(named: "test"))!)
        @unknown default:
            WidgetView(_entry: (entry.image ?? UIImage(named: "test"))!)
        }
    }
}


@main
struct WidgetAppExtention: Widget {
    let kind: String = "WidgetAppExtention"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            WidgetAppExtentionEntryView(entry: entry)
        }
        .supportedFamilies([.systemSmall, .systemMedium])
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct WidgetAppExtention_Previews: PreviewProvider {
    static var previews: some View {
        WidgetAppExtentionEntryView(entry: SimpleEntry(date: Date(), image: UIImage(named: "test2")))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
