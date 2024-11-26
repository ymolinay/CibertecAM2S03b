//
//  ListaTarasView.swift
//  Session04c
//
//  Created by DAMII on 25/11/24.
//

import SwiftUI

struct ListaTareasView : View {
    var proyecto: Proyecto
    @ObservedObject var modelo: ModeloProyecto
    @State private var mostrarRegistro: Bool = false

    var body: some View {
        VStack {
            List {
                ForEach(proyecto.tareas) { item in
                    Text(item.titulo)
                }
            }
            .navigationTitle("Tareas")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        mostrarRegistro = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $mostrarRegistro) {
                RegistroTareaView(
                    proyecto: proyecto,
                    modelo: modelo,
                    mostrar: $mostrarRegistro)
            }
        }
    }
}
