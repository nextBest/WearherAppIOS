//
//  SunView.swift
//  WeatherApp
//
//  Created by Mateusz Skalkowski on 26/02/2020.
//  Copyright © 2020 Mateusz Skałkowski. All rights reserved.
//

import UIKit

class SunView: UIView {
    
    private let minutesInDay = 1440
    private let groundMarginBottom: CGFloat = 30
    private let horizontalMargin: CGFloat = 10
    private let circleRadius: CGFloat = 6
    private let lineWidth: CGFloat = 1
    private let textMarginTop: CGFloat = 6
    private var sunrise: Date?
    private var sunset: Date?
    private var timezone: String?
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext(), let sunrise = sunrise, let sunset = sunset, let timezone = timezone else { return }
        let groundYPosition = bounds.height - groundMarginBottom
        let width = bounds.width - (2 * horizontalMargin)
        let minuteWidth = width / CGFloat(minutesInDay)
        let sunrisePosition = CGFloat(sunrise.getMinuteOfDay(timezone: timezone)) * minuteWidth
        let sunsetPosition = CGFloat(sunset.getMinuteOfDay(timezone: timezone)) * minuteWidth
        drawSky(in: context)
        drawGround(in: context, groundYPosition: groundYPosition)
        drawSunrise(in: context, groundYPosition: groundYPosition, sunrisePosition: sunrisePosition, sunrise: sunrise, timezone: timezone)
        drawSunset(in: context, groundYPosition: groundYPosition, sunsetPosition: sunsetPosition, sunset: sunset, timezone: timezone)
        drawDay(in: context, groundYPosition: groundYPosition, sunrisePosition: sunrisePosition, sunsetPosition: sunsetPosition)
    }
    
    func setupData(sunrise: Date, sunset: Date, timezone: String) {
        self.sunrise = sunrise
        self.sunset = sunset
        self.timezone = timezone
        setNeedsDisplay()
    }
    
    private func drawSky(in context: CGContext) {
        context.draw(UIImage.sky.cgImage!, in: bounds)
    }
    
    private func drawGround(in context: CGContext, groundYPosition: CGFloat) {
        context.setStrokeColor(UIColor.white.cgColor)
        context.setLineWidth(lineWidth)
        context.move(to: CGPoint(x: horizontalMargin, y: groundYPosition))
        context.addLine(to: CGPoint(x: bounds.width - horizontalMargin, y: groundYPosition))
        context.strokePath()
    }
    
    private func drawSunrise(in context: CGContext, groundYPosition: CGFloat, sunrisePosition: CGFloat, sunrise: Date, timezone: String) {
        context.setFillColor(UIColor.yellow.cgColor)
        context.addArc(center: CGPoint(x: sunrisePosition, y: groundYPosition), radius: circleRadius, startAngle: 0, endAngle: .pi * 2, clockwise: false)
        context.drawPath(using: .fill)
        drawText(text: sunrise.toHour(timezone: timezone), groundYPosition: groundYPosition, centerPosition: sunrisePosition)
    }
    
    private func drawSunset(in context: CGContext, groundYPosition: CGFloat, sunsetPosition: CGFloat, sunset: Date, timezone: String) {
        context.setFillColor(UIColor.yellow.cgColor)
        context.addArc(center: CGPoint(x: sunsetPosition, y: groundYPosition), radius: circleRadius, startAngle: 0, endAngle: .pi * 2, clockwise: false)
        context.drawPath(using: .fill)
        drawText(text: sunset.toHour(timezone: timezone), groundYPosition: groundYPosition, centerPosition: sunsetPosition)
    }
    
    private func drawText(text: String, groundYPosition: CGFloat, centerPosition: CGFloat) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        let font = UIFont.systemFont(ofSize: 14.0)
        
        let attributes: [NSAttributedString.Key: Any] = [
            .paragraphStyle: paragraphStyle,
            .font: font,
            .foregroundColor: UIColor.white
        ]
        
        let textHeight = font.lineHeight
        let textWidth = text.widthWithConstrainedHeight(height: textHeight, font: font)
        let attributedString = NSAttributedString(string: text, attributes: attributes)
        let stringRect = CGRect(x: centerPosition - (textWidth / 2), y: groundYPosition + textMarginTop, width: textWidth, height: textHeight)
        attributedString.draw(in: stringRect)
    }
    
    private func drawDay(in context: CGContext, groundYPosition: CGFloat, sunrisePosition: CGFloat, sunsetPosition: CGFloat) {
        context.setStrokeColor(UIColor.yellow.cgColor)
        context.setFillColor(UIColor.day.cgColor)
        let sunDiff = (sunsetPosition - sunrisePosition)/2
        let xPosition = sunDiff + sunrisePosition
        context.addArc(center: CGPoint(x: xPosition, y: groundYPosition), radius: sunDiff, startAngle: .pi, endAngle: .pi * 2, clockwise: false)
        context.drawPath(using: .fillStroke)
    }
}
