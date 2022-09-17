# f: \mathbb{R}^n \rightarrow \mathbb{R}^m
# P é o parâmetro de dumping: Opções : 1 - 5
using ForwardDiff
using LinearAlgebra
function Levenberg_Maquardt(R, x0, λ, P, itmax = 100000, ε = 1.0e-8)
    x = x0
    n = length(x)
    jab(x) = ForwardDiff.jacobian(R, x)
    g(x) = jab(x)'* R(x)
    d = rand(n)
    k = 0
    while norm(R(x), 2) > ε  && k < itmax
        if P == 1
            λ = 2* norm(g(x), 2)^2/norm(R(x),2)^2
        end
        if P == 2
            λ =  norm(g(x), 2)^2
        end
        if P == 3
            λ =  norm(g(x), 2)
        end
        if P == 4
            λ = norm(R(x), 2)^2
        end
        if P == 5
            λ =  norm(g(x), 2)^2/norm(R(x),2)^2
        end
        d =  (jab(x)' * jab(x) + λ * I(n))\(- jab(x)' * R(x) )
        x = x + d
        k = k + 1
    end
    return x, k 
end
