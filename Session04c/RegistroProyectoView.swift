//
//  RegistroProyectoView.swift
//  Session04c
//
//  Created by DAMII on 25/11/24.
//

import SwiftUI

struct RegistroProyectoView : View {
    @ObservedObject var modelo: ModeloProyecto
    @Binding var mostrar: Bool
    @State private var titulo: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Título", text: $titulo)
                Button("Guardar") {
                    let nuevo = Proyecto(
                        id: UUID(),
                        titulo: titulo,
                        tareas: [])
                    modelo.proyectos.append(nuevo)
                    mostrar = false
                }
            }
            .navigationTitle("Registro")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        mostrar = false
                    }
                }
            }
        }
    }
}
