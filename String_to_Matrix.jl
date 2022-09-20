function String_to_matrix(A)
    B = chop(A, head =1, tail=1)
    C = split(B, " ")
    for i in  1:(Int(length(C)/2)-1)
        C[2*i] = chop(C[2*i], tail=1)
    end
    D = rand(Int(length(C)))
    for i in 1: Int(length(C))
        D[i]  =  parse(Float64, C[i])
    end
    E = rand(Int(length(D)/2), 2)
    for i in 1:Int(length(D)/2)
        E[i,1] = D[2*i-1]
        E[i,2] = D[2*i]
    end
    return E
end