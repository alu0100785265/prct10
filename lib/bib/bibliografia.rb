class Bibliografia
    
        include Comparable
        attr_accessor :autores, :titulo,  :fecha
        
        
        
        def initialize(autor, titulo,  fecha)
            raise ArgumentError, 'Tiene que haber al menos un autor' if autor.length == 0
            raise ArgumentError if ( (fecha.class != Date) ||
                                    !(Date.valid_date?(fecha.year,fecha.month, fecha.mday)))
            
            @autores = Array.new
            @titulo = titulo
            @fecha = fecha
            autor.each do |item|
            @autores.push "#{item}"
            end #bucle each
            
        end 
        
       
        
        def <=>(other)
			if(@autores == other.autores)
				if(@fecha == other.fecha)
					if(@titulo == other.titulo)
					     	return 0
					else
						arr = [@titulo, other.titulo]
						arr.sort_by!{|t| t.downcase}
						if(arr.first == @titulo)
							return 1
						end
						return -1
					end
				elsif fecha > other.fecha
					return -1
				else
					return 1
				end
			else
				arr = [@autores, other.autores]
				arr.sort_by!{|t| t.downcase}
				if(arr.first == @autores)
					return -1
				end
				return 1
			end
		end
	

        
        
        def to_s()
            @autores.each_with_index do |nombre, i|
                print(nombre)
                if (i == (@autores.length-1))
                    puts 
                else
                    print(", ") 
                end #if
            end #do
            puts("#{@titulo}")
            puts @fecha
        end 

    end 
#


class Libros < Bibliografia
    
    attr_accessor  :serie, :editorial, :n_edicion, :isbn, :editorial
    
    def initialize(autor, titulo, serie, edicion, editorial, fecha, isbn)
        super(autor, titulo, fecha)
        raise ArgumentError if (isbn.class != Hash)
            @isbn = isbn
            @n_edicion = edicion
            @serie = serie
            @editorial = editorial
        end #initialize
        

     def getISBN()
            p @isbn
        end #getISBN
    
    #Invalidamos el to_s de Bibliografia
     def to_s()
        (" #{@fecha} " + " #{@titulo.uppcase} " + "(#{@n_edicion})" + "(#{serie})" + " (#{@editorial})")
    end #to_s

end

class Publicaciones < Bibliografia
    
    attr_accessor :url

    def initialize(autor, titulo, fecha, url)
        super(autor, titulo, fecha)
           @url = url
    end #initialize
    
    
   def to_s()
            
            (" #{@fecha} " + " #{@titulo} " + " Web " + " #{@url} ")
            end 
end




class Revistas < Bibliografia
    
    attr_accessor :serie, :n_edicion, :issn, :editorial

    def initialize(autor, titulo, serie, ed, nEd, fecha, issn)
        super(autor, titulo,fecha)
            raise ArgumentError if (issn.class != Hash)
            @issn = issn
            @editorial = ed
            @serie = serie
            @n_edicion = nEd
    end #initialize
    
   def to_s()
    (" #{@fecha} " + " #{@titulo.uppcase} " + "(#{@n_edicion})" + "(#{serie})" + " (#{@editorial})")
    end #to_s
end