//
//  ContentView.swift
//  Session04c
//
//  Created by DAMII on 25/11/24.
//

import SwiftUI

class ModeloProyecto : ObservableObject {
    @Published var proyectos: [Proyecto] = [] {
        didSet {
            guardarDatos()
        }
    }
    
    init() {
        cargarDatos()
    }
    
    private func archivoUrl() -> URL {
        let documentos = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentos.appendingPathComponent("proyectos.json")
    }
    
    private func guardarDatos() {
        do {
            let datos = try JSONEncoder().encode(proyectos)
            try datos.write(to: archivoUrl())
        } catch {
            print("Error al guardar datos \(error)")
        }
    }
    
    private func cargarDatos() {
        do {
            let datos = try Data(contentsOf: archivoUrl())
            proyectos = try JSONDecoder().decode([Proyecto].self, from: datos)
        } catch {
            print("Error al cargar datos \(error)")
        }
    }
}

struct ContentView: View {
    @StateObject private var modelo = ModeloProyecto()
    
    var body: some View {
        NavigationView {
            ListaProyectosView(modelo: modelo)
        }
    }
}
