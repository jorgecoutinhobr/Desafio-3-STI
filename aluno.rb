# frozen_string_literal: true

class Aluno
  attr_accessor :matricula, :curso

  def initialize matricula
    @matricula = matricula
    @cursos = []
  end

  def adicionar_curso curso
    @cursos << curso
  end

  def calcular_cr
    pontos = 0.0
    horas = 0
    @cursos.each do |curso|
      pontos += curso[:nota] * curso[:carga_horaria]
      horas += curso[:carga_horaria]
    end
    pontos / horas
  end
end
