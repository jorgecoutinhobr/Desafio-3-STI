# frozen_string_literal: true
require './aluno'

class Curso
  attr_accessor :alunos, :codigo

  def initialize codigo
    @codigo = codigo
    @alunos = []
  end

  def adicionar_aluno aluno
    @alunos << aluno
  end

  def media_cr
    total = 0.0
    @alunos.each do |aluno|
      total += aluno.calcular_cr
    end
    total / @alunos.size
  end
end
