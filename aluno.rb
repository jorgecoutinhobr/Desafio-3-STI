class Aluno
  attr_accessor :matricula, :historicos
  def initialize(matricula, historico)
    @matricula = matricula
    @historicos = historico
  end

  def calcular_cr_aluno
    numerador = 0
    denominador = 0
    @historicos.each do |historico|
      nota = historico['NOTA'].to_i
      horas = historico['CARGA_HORARIA'].to_i
      numerador += (nota*horas)
      denominador += horas
    end
    numerador/denominador
  end
end
