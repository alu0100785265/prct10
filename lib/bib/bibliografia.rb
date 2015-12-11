class Bibliografia
    
        include Comparable
        attr_accessor :autores, :titulo,  :fecha
        
        
        
        def initialize(autor, titulo,  fecha)
           
            
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

class Libro < Bbl
    attr_accessor :editorial, :serie, :edicion, :numero_ISBN
    def initialize(autores, titulo, editorial, serie, edicion, publicacion, isbn)
      super(autores,titulo,publicacion)
      @editorial = editorial
      @serie = serie
      @edicion = edicion
      @numero_ISBN = Array.new(isbn)
    end
    def to_s
      "#{@autores}, #{@numero_ISBN},#{@titulo},#{@editorial},#{@serie},#{@edicion},#{@fecha}"
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

class Articulo < Bbl
  attr_accessor :numero_ISSN
  
  def initialize(autores, titulo, publicacion, issn)
      super(autores,titulo,publicacion)
      @numero_ISSN = Array.new(issn)
  end
  
   def to_s
    "#{@autores}, #{@titulo},#{@fecha},#{@numero_ISSN}"
   end
  end
  
  
  class Doc_electronico < Bbl
  attr_accessor :url
  def initialize(autores, titulo, publicacion, url)
      super(autores,titulo,publicacion)
      @url = url
  end
  
  def to_s
    "#{@autores},#{@titulo},#{@fecha},#{@url}"
  end
  end 
class Periodico < Bbl
  attr_accessor :titular, :categoria
  def initialize(autores, titular, fecha, publicacion, categoria)
      super(autores,fecha,publicacion)
      @titular =titular
      @categoria = categoria
  end
    
    def to_s
    
       "#{@autores},#{@titular},#{@fecha},#{@categoria}"
       
    end end