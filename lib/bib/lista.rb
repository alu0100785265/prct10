Node = Struct.new(:value, :next, :prev)


class Lista
    
    include Enumerable
    attr_reader :cabeza, :fin
   
    def initialize(valor)
        @cabeza = Node.new(valor,nil,nil)
        @final = @cabeza
        
    end
    
   
    
 
 
 
    
    def extract_inicio()
        if(empty() != true)
            var_ini = @cabeza
            @cabeza = @cabeza.next
            return var_ini
        else
            return nil
        end
    end
     
    def extract_final()
         if(empty() != nil)
            var_ini = @final
            @final = @final.prev
            if (@final == nil)
                @cabeza = nil
                @final = nil
            end
            return var_ini
         else
             return nil
         end
    end
    
    def to_s()
        var_ini = @cabeza
        while(empty() != true) do
            puts"#{var_ini.value}"
            var_ini = var_ini.next
            if(var_ini == nil)
                break
            end
        end
    end
    
    def empty()
        if(@cabeza != nil)
            return false
        else
            return true
        end
    end
    
    def insert(valor)
        
        if ((valor.instance_of? Node) != true)
             node = Node.new(valor,nil,nil)
        else
             node = valor
        end
        
        if(empty() == true)
            @cabeza = node
            @cabeza.next = nil
            @cabeza.prev = nil
            @final = @cabeza
        else
            var_ini = @final
            @final = node
            var_ini.next = @final
            @final.prev = var_ini
            @final.next = nil
        end
    end
    
    def arrays(*array)
        array.each do |nodo|
            if(empty() != true)
                var_ini = @final
                @final = nodo
                var_ini.next = @final
                @final.prev = var_ini
            else
                @cabeza = nodo
                
                @final = @cabeza
                
            end
        end
    end
   
   def insert_empty(nodo)
       node = Node.new(nodo) 
       @cabeza = node
       @final = node
       
   end
    
    def insert_end(nodo)
        if (!empty())
           @final.next = Node.new(nodo,nil,@final)
            @final = @final.next
        else
            
             insert_empty(nodo)
        end
    end
    
    def insert_inicio(node)
        if(!empty())
            @cabeza.prev = Node.new(node,@cabeza)
            @cabeza = @cabeza.prev
           
        else
           insert_empty(node)
        end
           
    end
   
    def each
         var_ini = @cabeza
         if (@cabeza == nil and @final == nil)
                
                yield nil
                
            elsif (@cabeza == @final)
                
                yield @cabeza.value
            else
                while(var_ini != nil)
                    yield var_ini.value  
                    var_ini = var_ini.next 
                end
         end
    end
    
end
