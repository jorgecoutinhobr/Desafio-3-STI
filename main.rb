require 'csv'
require './aluno'
require './curso'
require './universidade'
require './printer'

PATH = './dados/notas.csv'.freeze

uff = Universidade.new
dados = CSV.read(PATH, headers: true)
alunos = dados.group_by {|dado| dado['MATRICULA']}
cursos = dados.group_by {|dado| dado['COD_CURSO']}

alunos.each { |chave,valor| uff.adicionar_aluno(Aluno.new(chave, valor))}
cursos.each{ |chave,valor| uff.adicionar_curso(Curso.new(chave, valor))}


Printer.imprimir_cr_alunos(uff.alunos)
Printer.imprimir_cr_cursos(uff.media_final)


# uff.media_final.each do |c, v|
#   puts "#{c.cod_curso} - #{v}"
# end
puts '=================================================='
uff.calcular_media_por_matricula_e_curso.each do |c, v|
  print "#{c} - "
  v.each do |p, l|
    print "(#{p.cod_curso} #{l}) "
  end
  print "\n"
end
