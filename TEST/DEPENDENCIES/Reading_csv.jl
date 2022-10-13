struct Problema
        nome  :: String
        dados :: Array{Float64,2}
        n     :: Int64
        dim   :: Int64
        model :: Function
        solution :: Vector{Float64}
end    
function Read_CSV(arquivo)
        prob = readdlm(arquivo,':')
        return Problema(prob[1,2],eval(Meta.parse(prob[2,2])),prob[3,2],prob[6,2],eval(Meta.parse(prob[5,2])),eval(Meta.parse(prob[9,2])))
end

