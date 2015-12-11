
require 'spec_helper'
require 'bib'




  context "#APA" do
       before :each do
          
        nombres = 'Pepe Asecas:Manuel Ventura:Mariano Rajoy'.split(':')
        @art1 = Publicaciones.new(nombres,"Lavida",Date.new(2052,4,10),"http://wwww.android.developers.com")
        @art = Publicaciones.new(nombres,"Lavida",Date.new(2052,4,10),"http://wwww.android.developers.com")
        @a = Apa.new(@art)
        @b = Apa.new(@art1)
       
       end
   
    
        it "comprobar que existe" do
            expect(@a).to be_kind_of(Apa)
   end
        it "Debe existir la clase APA" do
            expect(@a).not_to eq(nil)
        end
        
        it "La clase tiene  una lista enlazada" do
            expect(@a.list).not_to eq(nil)
        end
   
        it "Existe un metodo que formatea y ordena los nombres" do
           aux = 'Rajoy M.:Ventura M.'.split(':')
           expect(@a.getAutores(@art)).to eq(aux)
        end
        
        it "Extraemos la referencia"do
            aux = 'Rajoy M.:Ventura M.'.split(':')
            ref = "#{aux} 4/5/2110 Vida Web http://www.lavida.com"
            expect(@a.listaBiblios)
        end
    end



	