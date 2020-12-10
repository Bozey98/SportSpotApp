//
//  MapDrawer.swift
//  SportSpot
//
//  Created by Денис Мусатов on 23.11.2020.
//

import Mapbox

struct MapDrawer {
    var style: MGLStyle
    var shapeSource: MGLShapeSource
    
    init(style: MGLStyle, features: [MGLShape & MGLFeature]) {
        self.style = style
        self.shapeSource = MGLShapeSource(identifier: "buildingSource", features: features, options: [.clustered: true])
        self.style.addSource(shapeSource)
    }
    
    func makeImage(imageName: String, identidier: String, offsetX: Double = 0, offsetY: Double = 0) {
        
        guard let iconImage = UIImage(named: imageName) else { return }
        
        style.setImage(iconImage, forName: identidier)
        
        let iconLayer = MGLSymbolStyleLayer(identifier: identidier, source: shapeSource)
        iconLayer.iconImageName = NSExpression(forConstantValue: identidier)
        iconLayer.iconTranslation = NSExpression(forConstantValue: NSValue(cgVector: CGVector(dx: offsetX, dy: offsetY)))
        iconLayer.iconAllowsOverlap = NSExpression(forConstantValue: true)
        
        style.addLayer(iconLayer)
        
    }
    
    func makeCircle(identidier: String, radius: Double = 10 ,offsetX: Double = 0, offsetY: Double = 0) {
        
        let circleLayer = MGLCircleStyleLayer(identifier: identidier, source: shapeSource)
        
        circleLayer.circleRadius = NSExpression(forConstantValue: radius)
        circleLayer.circleColor = NSExpression(forConstantValue: UIColor.init(named: "darkBlue"))
        circleLayer.circleStrokeColor = NSExpression(forConstantValue: UIColor.white)
        circleLayer.circleTranslation = NSExpression(forConstantValue: NSValue(cgVector: CGVector(dx: offsetX, dy: offsetY)))
        
        style.addLayer(circleLayer)
    }
    
    func makeText(text: String, identidier: String, offsetX: Double = 0, offsetY: Double = 0) {
        let textLayer = MGLSymbolStyleLayer(identifier: identidier, source: shapeSource)
        
        textLayer.text = NSExpression(forConstantValue: text)
        textLayer.textTranslation = NSExpression(forConstantValue: NSValue(cgVector: CGVector(dx: offsetX, dy: offsetY)))
        textLayer.textAllowsOverlap = NSExpression(forConstantValue: true)
        textLayer.textColor = NSExpression(forConstantValue: UIColor.white)
        textLayer.textFontSize = NSExpression(forConstantValue: 12)
        
        style.addLayer(textLayer)
    }
}

