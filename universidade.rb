# frozen_string_literal: true
require 'csv'
require './aluno'
require './curso'

class Universidade
  attr_accessor :alunos, :cursos
  PATH = 'database/notas.csv'.freeze

  def initialize
    @alunos = {}
    @cursos = {}
  end

  def carregar_alunos
    CSV.foreach(PATH, headers: true, header_converters: :symbol) do |linha|
      matricula = linha[:matricula]
      cod_disciplina = linha[:cod_disciplina]
      cod_curso = linha[:cod_curso]
      nota = linha[:nota].to_f
      carga_horaria = linha[:carga_horaria].to_f

      aluno = @alunos[matricula] ||= Aluno.new(matricula)
      aluno.adicionar_curso({ nota: nota, carga_horaria: carga_horaria })

      curso = @cursos[cod_curso] ||= Curso.new(cod_curso)
      curso.adicionar_aluno(aluno) unless curso.alunos.include?(aluno)
    end
  end

  def print
    puts "------- O CR dos alunos é: --------"
    @alunos.each do |matricula, aluno|
      puts "#{matricula}  -  #{aluno.calcular_cr.round(2)}"
    end

    puts "----- Média de CR dos cursos ------"
    @cursos.each do |codigo, curso|
      puts "#{codigo}  -  #{curso.media_cr.round(2)}"
    end
  end
end
