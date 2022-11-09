//
//  main.swift
//  Actividad_1_Variables
//
//  Created by Kaiscer Vasquez on 1/11/22.
//

import Foundation


var enunciados : String = """
Seleciona la opción que deseas realizar:

1 - Calcular el perímetro y área de un rectángulo dada su base y su altura.
2 - Dados los catetos de un triángulo rectángulo, calcular su hipotenusa. función sqrt(). Nota: en online no funciona
3 - Dados dos números, mostrar la suma, resta, división y multiplicación de ambos.
4 - Escribir un programa que convierta un valor dado en grados Fahrenheit a grados Celsius.
5 -  Calcular la media de tres números pedidos por teclado

6 - Un vendedor recibe un sueldo base más un 10% extra por comisión de sus ventas,
el vendedor desea saber cuánto dinero obtendrá por concepto de comisiones
por las tres ventas que realiza en el mes y el total que recibirá en el mes tomando en cuenta su sueldo base y comisiones.

7 - Un alumno desea saber cuál será su calificación final en la materia de IOS Dicha calificación se compone de los siguientes porcentajes:
 * 55% del promedio de sus tres calificaciones parciales.
 * 30% de la calificación del examen final.
 * 15% de la calificación de un trabajo final.

8 - Escribir un algoritmo para calcular la nota final de un estudiante, considerando que:
- Por cada respuesta correcta 5 puntos
- Por una incorrecta -1
- Por respuestas en blanco 0.
Imprime el resultado obtenido por el estudiante.

9 - Calcula el sueldo de un trabajador, cuyo valor es su sueldo base más un número de horas extra trabajadas,
pero teniendo en cuenta que el dicho número de horas puede ser nulo

0 - para salir
"""

//****** TOOLS ******

func resquestInt(ask : String) -> Int {
    var input : String?
    while true {
        print(ask, terminator: "")
        input = readLine()
        if let num = Int(input ?? ""){
            return num
        }
        print("Desbes introducir un valor entero")
        
    }
}

func requestDouble(ask : String) -> Double{
    var input: String?
    while true {
        print(ask, terminator: "")
        input = readLine()
        if let num = Double(input ?? ""){
            return num
        }
        print("El valor introducido no es un double válido")
    }
}


func requestRangeDouble(ask: String, min: Double, max: Double) -> Double {
    var input: Double
    while true {
        input = requestDouble(ask: ask)
        if (input >= min && input <= max) {
            return input
        }
        print(String(format: "El valor tiene que estar en el rango de [%.3f, %.3f]", min, max))
    }
}

func requestRangeInt(ask: String, min: Int, max: Int) -> Int {
    var input: Int
    while true {
        input = resquestInt(ask: ask)
        if (input >= min && input <= max) {
            return input
        }
        print(String(format: "El valor tiene que estar en el rango de [%.3f, %.3f]", min, max))
    }
}

func resquestRangeString(ask: String, opciones: [String]) -> String {
    var input: String?
    while true{
        print(ask, terminator: "")
        input = readLine()
        if (input != nil && opciones.contains(input!)){
            return input!
        }
           
        print("Opcion no valida. Opciones: ", opciones)
    }
    
}

func control(ask: String, opciones: [Int]) -> Int{
    var input: String?
    while true{
        print(ask, terminator: "")
        input = readLine()
        if let num = Int(input ?? ""){
            if (num >= 0 && opciones.contains(num)){
                return num
            }
            print("Debes introducir un número entre: ", opciones)
        }
        print("Debes introducir un número entre: ", opciones)
    }
    
}
    
    
    //**** CODE ******
    let DOUBLE_INFINITY: Double = Double.infinity
    let INTEGER_INFINITY: Int = Int.max
    
    func eje1(){
        print("Introduce la base y la altura del rectángulo:")
        let base = requestRangeDouble(ask: " base =  ", min: 0, max: DOUBLE_INFINITY)
        let altura = requestRangeDouble(ask: " altura =  ", min: 0, max: DOUBLE_INFINITY)
        //area = base * altura
        //Perimetro = la suma de los 4 lados
        print(String(format:"\nEl area es %.2f y el perímetro es %.2f \n", base * altura, 2 * (base + altura)))
        print()
    }
    
    func eje2(){
        print("Introduce los catetos del triángulo: ")
        let cMayor = requestRangeDouble(ask: " Cateto Mayor = " , min: 0, max: DOUBLE_INFINITY)
        let cMenor = requestRangeDouble(ask: " Cateto Menor = ", min: 0, max: DOUBLE_INFINITY)
        //h^  = catetoMayo^ + catetoMenor^
        let h = sqrt(cMayor * cMayor + cMenor * cMenor)
        print(String(format: "\nLa hipotenusa de triángulo es: %.2fcm\n", h))
        print()
    }
    
    func eje3(){
        print("Introduce los valores con los que vamos a operar:")
        let num1 = requestRangeDouble(ask: " número 1 = ", min: 0, max: DOUBLE_INFINITY)
        let num2 = requestRangeDouble(ask: " número 2 = ", min: 0, max: DOUBLE_INFINITY)
        
        print(String(format: "La suma es: %.2f + %.2f = %2.f", num1, num2, num1 + num2))
        print(String(format: "La resta es: %.2f + %.2f = %2.f", num1, num2, num1 - num2))
        print(String(format: "La multiplicación es: %.2f + %.2f = %2.f", num1, num2, num1 * num2))
        print(String(format: "La división es: %.2f + %.2f = %2.f", num1, num2, num1 / num2))
        print()
    }
    
    func eje4(){
        print("Ingresa los grados Fahrenheit:")
        let fah = requestDouble(ask: " º(f) = ")
        let cen = (fah - 32) * 5 / 9
        
        print(String(format: "%.fº Fahrenheit son %.fº Celsius", fah, cen))
        print()
        
    }
    
    func eje5(){
        print("Introduce los valores de la cual vamos a calcular la media")
        let num = requestRangeInt(ask: " Cúantos números vas a introducir: ", min: 0, max: INTEGER_INFINITY)
        var sum: Double = 0
        for i in 1...num{
            sum += requestDouble(ask: String(format: "%iº número: ", i))
        }
        let avg = sum / Double(num)
        print(String(format: "La media de los números introducidos es: %.2f", avg))
        print()
    }
    
    func eje6(){
        print("Introduce los siguentes datos:")
        let sbase = requestRangeDouble(ask: "Salario base = ", min: 0, max: DOUBLE_INFINITY)
        let numV = requestRangeInt(ask: "número de vestas = ", min: 0, max: INTEGER_INFINITY)
        var comisiones: Double = 0
        if numV >= 1{
            for i in 1...numV{
                comisiones += requestRangeDouble(ask: String(format: " venta %iº = ", i), min: 0, max: DOUBLE_INFINITY) * 0.1
            }
        }
        print(String(format: "Las comisiones por las (%i) ventas es : %.2f", numV, comisiones))
        print()
        print(String(format: "El salario a persivir: %.2f + %.2f = %.2f", sbase,comisiones, sbase + comisiones))
    }
    
    func eje7(){
        print("Para cualcular la nota de IOS debes introducir los siguientes datos:")
        var prubaP: Double = 0
        for i in 1...3{
            prubaP += requestRangeDouble(ask: String(format:"Nota del %iº parcial: ",i), min: 0, max: 10) / 3
        }
        let exaFinal = requestRangeDouble(ask: "Nota del exámen final: ", min: 0, max: 10)
        let traFinal = requestRangeDouble(ask: "Nota del trabajo final: ", min: 0, max: 10)
        print("La nota final es: ")
        print(String(format: ".55 * %.2f + .3 * %.2f + .15 * %.2f = %.2f", prubaP, exaFinal, traFinal, 0.55 * prubaP + 0.3 * exaFinal + 0.15 * traFinal))
        print()
        
    }
    
    func eje8(){
        print("Introduce los siguientes datos: ")
        let RESP_C = 5
        let RESP_I = -1
        let SIN_R = 0
        let numP = requestRangeInt(ask: "Número de preguntas: ", min: 1, max: INTEGER_INFINITY)
        print("Indaca si la respusta del ejercicio fue correcta, incorrecta o sin respuesta")
        var nota: Int = 0
        for i in 1...numP{
            switch (resquestRangeString(ask: String(format: "Respuesta del eje%i = ",i), opciones: ["c", "i", "s"])) {
            case "c":
                nota += RESP_C
            case "i":
                nota += RESP_I
            default:
                nota += SIN_R
            }
        }
        print(String(format: "\nNota: %i/%i", nota, numP * RESP_C))
        print()
        
    }
    
    func eje9(){
        print("Para culcualar el sueldo base por horas nesecitas introducir los siguientes datos:")
        let salrio_B = requestRangeDouble(ask: "Salario basae = ", min: 0, max: DOUBLE_INFINITY)
        let salario_ExH = requestRangeDouble(ask: "Salario horas extras = ", min: 0, max: DOUBLE_INFINITY)
        let horas_T = requestRangeInt(ask: "Horas base Trabajadas = ", min: 4, max: 40)
        let horas_Ex = requestRangeInt(ask: "Horas extras trabajas = ", min: 0, max: 30)
        
        print(String(format: "Sueldo a devengar: %i * %.2f + %i * %.2f = %.2f", horas_T, salrio_B, horas_Ex, salario_ExH, Double(horas_T) * salrio_B + Double(horas_Ex) * salario_ExH ))
        
    }
    
    
    
    
    
    
    
    
    // ****** LOOP ********
    
    
    var exitDefautl = true
    
    while exitDefautl {
        print(enunciados)
        switch (control(ask: "Selecciona la opción que quieres ejecutar: ", opciones: [0,1,2,3,4,5,6,7,8,9])){
        case 1:
            eje1()
        case 2:
            eje2()
        case 3:
            eje3()
        case 4:
            eje4()
        case 5:
            eje5()
        case 6:
            eje6()
        case 7:
            eje7()
        case 8:
            eje8()
        case 9:
            eje9()
        case 0:
            print("Fin de la ejecucion")
            exitDefautl = false
            break
        default:
            print("El Fin de la ejecución")
        }
        
        
    }

        
    
