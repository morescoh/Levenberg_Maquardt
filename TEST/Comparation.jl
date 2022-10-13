Arquivos = readdir(Pasta)
    v = zeros(Int64, length(Arquivos))
        for i in 1:Int32(length(Arquivos))      
            texto = Pasta * Arquivos[i]
            Leitura = Read_CSV(texto)
            Result = Levenberg_Maquardt(Leitura.dados, Leitura.model, Leitura.dim, PD)
            v[i] = Result[2]
            if Result[2] >= 1000
                break
                return("Estourou o número máximo de iterações")
            end
        end
return v, (ones(length(v)) / length(v))'*v
