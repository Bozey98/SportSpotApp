//
//  MainMapView.swift
//  SportSpot
//
//  Created by Денис Мусатов on 13.11.2020.
//

import SwiftUI
import Mapbox

struct MapView: UIViewRepresentable {
    
    @EnvironmentObject var showModals: AppContext
    
    let mapView = MGLMapView(frame: .zero, styleURL: URL(string: "mapbox://styles/smpl98/ckhhj1hec1q5l19otslur59ki"))
    let locationManager = CLLocationManager()
    
    let points = [Point(latitude: 55.6598993345, longitude: 37.5975045826, id: 1)]
    //let points = PointsViewModel()
    
    init() {
        setupManager()
        mapView.allowsRotating = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .followWithCourse
        
        setCenter(isAnimated: false)
        mapView.reloadStyle(points)
        
        
    }
    
    func setupManager() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
    }
    
    func setCenter(isAnimated: Bool) {
        mapView.setCenter(locationManager.location?.coordinate ?? CLLocationCoordinate2D(), zoomLevel: 10, animated: isAnimated)
    }
    
    func makeUIView(context: Context) -> MGLMapView {
        
        let tapGesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.tapGesture(gesture:)))
        
        mapView.addGestureRecognizer(tapGesture)
        mapView.delegate = context.coordinator
        
        return mapView
    }
    
    func updateUIView(_ uiView: MGLMapView, context: Context) {
        mapView.reloadStyle(points)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MGLMapViewDelegate {
        var parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
        }
        
        func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
            return true
        }

        func mapView(_ mapView: MGLMapView, didFinishLoading style: MGLStyle) {
           setStyle(style: style)
        }
        
        func setStyle(style: MGLStyle) {
            
            let mapDrawer = MapDrawer(style: style, features: self.parent.points)
            
            mapDrawer.makeImage(imageName: "emptyPin", identidier: "pin")
            mapDrawer.makeImage(imageName: "football", identidier: "icon", offsetY: -7)
            mapDrawer.makeCircle(identidier: "notificator", offsetX: 20, offsetY: -20)
            mapDrawer.makeText(text: "\(5)", identidier: "eventsCount", offsetX: 20, offsetY: -20.5)
            
        }
        
        @objc func tapGesture(gesture: UITapGestureRecognizer) {
            
            guard let source = parent.mapView.style?.source(withIdentifier: "buildingSource") as? MGLShapeSource else { return }
            
            let location = gesture.location(in: self.parent.mapView)
            
            guard let feature = self.parent.mapView.visibleFeatures(at: location, styleLayerIdentifiers: Set(["icon"])).first else { return }
            
            if let cluster = feature as? MGLPointFeatureCluster {
                let children = source.children(of: cluster)
                print(children.map { $0.identifier})
            } else if let point = feature as? MGLPointFeature {
                print(point.identifier ?? 0)
                withAnimation {
                    self.parent.showModals.showPlayground.toggle()
                }
            }
            
        }
        
        
    }
    
    
}

