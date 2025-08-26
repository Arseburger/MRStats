import SwiftUI
import Charts

struct RanksView: View {
    @State var rankHistory: [RankStage]
    
    var ranks: [Ranks] {
        return rankHistory.reduce(into: []) { result, stage in
            result += [Ranks(stage.levelProgression.to)]
        }
    }
    
    var chartHeight: CGFloat { CGFloat(48 + ranks.uniqued(by: { rank in
        rank.rankString
    }).count * 30) }
    
    var chartWidth: CGFloat { CGFloat(60 + ranks.count * 32) }
    
    var dates: (String, String) {
        return (rankHistory.last!.date, rankHistory.first!.date)
    }
    
    var body: some View {
        VStack(spacing: 8) {
            SectionHeader(title: "Rank History")
            
            Chart {
                ForEach(rankHistory.sorted(by: <)) { stage in
                    PointMark(
                        x: .value("Date", stage.date),
                        y: .value("Rank", Ranks(stage.levelProgression.to).rankString)
                    )
                    .clipShape(Circle())
                    
                    .annotation(position: .overlay) {
                        MRImage(urlString: Ranks(stage.levelProgression.to).image)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                    }
                    .foregroundStyle(Ranks(stage.levelProgression.to).color.gradient)
                }
            }
            
            .chartYAxis {
                AxisMarks(preset: .extended, position: .leading) {
                    AxisValueLabel(
                        centered: true,
                        anchor: .trailing,
                        multiLabelAlignment: .trailing,
                        collisionResolution: .truncate,
                        offsetsMarks: false,
                        orientation: .horizontal,
                        horizontalSpacing: 16,
                    )
                    AxisGridLine()
                }
            }
            
            .chartXAxis {
                AxisMarks(preset: .aligned, position: .top) {
                    AxisValueLabel(
                        centered: true,
                        anchor: .bottom,
                        multiLabelAlignment: .top,
                        collisionResolution: .disabled,
                        offsetsMarks: false,
                        orientation: .horizontal
                    )
                    AxisGridLine()
                }
            }
            
            .chartScrollableAxes(.horizontal)
            .frame(idealHeight: chartHeight, maxHeight: .infinity)
            .frame(maxWidth: .infinity)
            .padding(8)
        }
        .materialShadowed()
        .padding(.horizontal)
    }
}
