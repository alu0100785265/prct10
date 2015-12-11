class Apa
    
    
    attr_accessor :list
    
    def initialize(valor)
        @list = Lista.new(valor)
        
    end
    
        
    def getAutores(valor)
        
            raise ArgumentError unless valor.is_a?(Bibliografia)
            nombres = Array.new()
            for i in 1...valor.autores.length do
                
               nombre, apellido = valor.autores[i].split(/\s+/)
               outName = "#{apellido} #{nombre[0]}."
               nombres.unshift(outName)
            end
            
            valor.autores = nombres.sort
            
    end
    

    def listaBiblios
        
        @list.each do |ref|
            getAutores(ref)
            ref.autores.each_with_index do |nombre, i|
                print(nombre)
                if (i != (ref.autores.length-1))
                    print(" & ") 
                end #if
            end 
           p (ref.to_s())
        end 
    end
end