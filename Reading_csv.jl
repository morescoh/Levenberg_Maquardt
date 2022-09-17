using CSV
using DataFrames
include("String_to_Matrix.jl")
Dados = CSV.read("/home/henriquem/Desktop/PROJECT_01/FILES/gaussian_9.5_3.0_1.5_450_86.csv", DataFrame)
Matriz = String_to_matrix(Dados[1,2])
Modelo = eval(Meta.parse(Dados[4,2]))