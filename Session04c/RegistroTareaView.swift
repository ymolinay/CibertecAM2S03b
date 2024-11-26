//
//  RegistroTareaView.swift
//  Session04c
//
//  Created by DAMII on 25/11/24.
//

import SwiftUI

struct RegistroTareaView : View {
    var proyecto: Proyecto
    @ObservedObject var modelo: ModeloProyecto
    @Binding var mostrar: Bool
    @State private var titulo: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Título", text: $titulo)
                Button("Guardar") {
                   
                    if let index = modelo.proyectos.firstIndex(where: { $0.id == proyecto.id }) {
                        let nuevo = Tarea(id: UUID(), titulo: titulo)
                        modelo.proyectos[index].tareas.append(nuevo)
                    }
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
