//
//  ListaProyectosView.swift
//  Session04c
//
//  Created by DAMII on 25/11/24.
//

import SwiftUI

struct ListaProyectosView : View {
    @ObservedObject var modelo: ModeloProyecto
    @State private var mostrarRegistro = false
    
    var body: some View {
        VStack {
            List {
                ForEach(modelo.proyectos) { item in
                    NavigationLink(
                        destination: ListaTareasView(proyecto: item, modelo: modelo)
                    ) {
                        Text(item.titulo)
                    }
                }
            }
            .navigationTitle("Proyectos")
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
                RegistroProyectoView(modelo: modelo, mostrar: $mostrarRegistro)
            }
        }
    }
}
