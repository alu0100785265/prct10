class Apa
    
    
    attr_accessor :list
    #En la clase solo vamos a tener como variable de instancia @list
    #que será una lista enlazada con diferentes referencias bibliograficas
    def initialize(valor)
        @list = Lista.new(valor)
        
    end
    
        #Los nombres de los autores están invertidos
        #hay que proporcionar el apellido y las iniciales
        # de todos los autores de un trabajo en particular
        #las entradas de la lista de referencias debe estar
        #en orden alfabetico de acuerdo a los apellidos del
        #primer autor de cada trabajo
    def getAutores(valor)
        #Creamos un array auxiliar
            raise ArgumentError unless valor.is_a?(Bibliografia)
            nombres = Array.new()
            for i in 1...valor.autores.length do
                #Dividimos el nombre en dos
                nombre, apellido = valor.autores[i].split(/\s+/)
                #Para mostrarlo seria el apellido y la inicial del nombre
                outName = "#{apellido} #{nombre[0]}."
                #incluimos el nombre en el array auxiliar
                nombres.unshift(outName)
            end
            #Hacemos que el array de nombres este ordenado
            valor.autores = nombres.sort
            #puts(valor.autores)
    end
    

    def listaBiblios
        #Invocamos al metodo getAutores
        #Para formatear los nombres de cada nodo
        #Y luego recorremos cada nodo de la lista
        #mostrando su referencia
        @list.each do |ref|#Al each de la lista enlazada le pasamos un nodo
            getAutores(ref)#Luego en el metodo each nos quedamos solo con el valor del nodo
            ref.autores.each_with_index do |nombre, i|
                print(nombre)
                if (i != (ref.autores.length-1))
                    print(" & ") #Imprimimos el ampersand
                end #if
            end #end each_with_index
           p (ref.getReferencia())
        end #end @list.each
    end
end