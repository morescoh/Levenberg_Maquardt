include("Levenberg_Maquardt.jl")
 R(x) = [x[1] * x[2] + x[2]^2 , x[1]^7 + x[3] + x[1] - 1 , x[3] + 1]
 y = [2,5,8]
 R(y)
 ForwardDiff.jacobian(R,y)
Levenberg_Maquardt(R, y, 0.5, 5)