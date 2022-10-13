function Put_in_vector(A,f,x0)
    s = rand(Int32(length(A[:,1])))
    for i in 1:Int32(length(A[:,1]))
        s[i] =  A[i,2] - f(A[i,1],x0)
    end
    return s    
end