//
//  ViewController.swift
//  project16
//
//  Created by Patrick on 05.08.2022..
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let london = Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), info: "https://en.wikipedia.org/wiki/London")
        let oslo = Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "https://en.wikipedia.org/wiki/Oslo")
        let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "https://en.wikipedia.org/wiki/Paris")
        let rome = Capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "https://en.wikipedia.org/wiki/Rome")
        let washington = Capital(title: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "https://en.wikipedia.org/wiki/Washington,_D.C.")

        mapView.addAnnotations([london, oslo, paris, rome, washington])
        mapView.mapType = .satellite

        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "eye"), style: .plain, target: self, action: #selector(changeMapView))
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is Capital else {return nil}

        let identifier = "Capital"

        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        annotationView?.pinTintColor = .cyan

        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            annotationView?.pinTintColor = .cyan

            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
        } else {
            annotationView?.annotation = annotation
        }

        return annotationView
    }

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let capital = view.annotation as? Capital else {return}

        let navController = UINavigationController()
        navController.viewControllers = [WikiDetailViewController(website: capital.info)]
        present(navController, animated: true)

//        let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
//        ac.addAction(UIAlertAction(title: "OK", style: .default))
//
//        present(ac, animated: true)
    }

    @objc func changeMapView() {
        let alertController = UIAlertController(title: "Change map style", message: nil, preferredStyle: .actionSheet)
        let standardMap = UIAlertAction(title: "Standard map", style: .default){ [weak self] _ in
            self?.mapView.mapType = .standard
        }

        let sateliteMap = UIAlertAction(title: "Satelite map", style: .default) { [weak self] _ in
            self?.mapView.mapType = .satellite
        }

        let hybridMap = UIAlertAction(title: "Hybrid map", style: .default) { [weak self] _ in
            self?.mapView.mapType = .hybrid
        }

        let hybridFlyoverMap = UIAlertAction(title: "Hybrid Flyover map", style: .default) { [weak self] _ in
            self?.mapView.mapType = .hybridFlyover
        }

        let sateliteFlyoverMap = UIAlertAction(title: "Satelite Flyover map", style: .default) { [weak self] _ in
            self?.mapView.mapType = .satelliteFlyover
        }

        let mutedStandardMap = UIAlertAction(title: "Standard muted map", style: .default) { [weak self] _ in
            self?.mapView.mapType = .mutedStandard
        }

        let cancelAc = UIAlertAction(title: "Cancel", style: .cancel)

        alertController.addAction(standardMap)
        alertController.addAction(sateliteMap)
        alertController.addAction(hybridMap)
        alertController.addAction(hybridFlyoverMap)
        alertController.addAction(sateliteFlyoverMap)
        alertController.addAction(mutedStandardMap)
        alertController.addAction(cancelAc)

        present(alertController, animated: true)
    }
}
