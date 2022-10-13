function Differentiation(A , f , t0 )
    n = Int32(length(A[:,1]))
    m = Int32(length(t0))
    M = rand(n,m)
    for i in 1:n
        K(t) =  A[i,2] - f(A[i,1],t)
        M[i,:] = ForwardDiff.gradient(K, t0)
    end
    return M
end