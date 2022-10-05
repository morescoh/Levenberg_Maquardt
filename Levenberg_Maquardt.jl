function Levenberg_Maquardt(A, f, dim, PD = 4, ε = 1.0e-5,  itmax = 1000)
    k      = 0
    y      = rand(Int32(dim))
    R(z)   = Put_in_vector(A,f,z)
    jab(z) = Differentiation(A, f, z)
    g(z)   = jab(z)' * R(z)
    λ = 0.2
    while norm(g(y), Inf) > ε && k < itmax
        if PD == 1
            λ = 2* norm(g(y), 2)^2/norm(R(y),2)^2
        end
        if PD == 2
            λ =  norm(g(y), 2)^2
        end
        if PD == 3
            λ =  norm(g(y), 2)
        end
        if PD == 4
            λ = norm(R(y), 2)^2
        end
        if PD == 5
            λ =  norm(g(y), 2)^2/norm(R(y),2)^2
        end
        d =  (jab(y)' * jab(y) + λ * I(Int32(dim)))\(- g(y))
        y = y + d
        k = k + 1
    end
    return y, k
end





