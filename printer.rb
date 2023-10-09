require './aluno'
require './curso'

module Printer
  def self.imprimir_cr_alunos(alunos)
    puts "------- O CR dos alunos é: --------"
    alunos.each do |aluno, historicos|
      cr_aluno = aluno.calcular_cr_aluno
      print ' '*13
      puts "#{aluno.matricula} - #{cr_aluno}"
    end
    puts "-----------------------------------"
  end

  def self.imprimir_cr_cursos(medias)
    puts '----- Média de CR dos cursos ------'
    medias.each do |curso, medias|
      media_total = medias.sum / medias.length
      print ' '*13
      puts "#{curso.cod_curso} - #{media_total}"
    end
    puts '-----------------------------------'
  end
end
