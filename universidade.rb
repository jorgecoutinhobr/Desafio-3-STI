require './curso'
require './aluno'

class Universidade
  attr_accessor :alunos, :cursos
  def initialize
    @alunos = []
    @cursos = []
  end

  def adicionar_aluno(aluno)
    @alunos.push(aluno)
  end

  def adicionar_curso(curso)
    @cursos.push(curso)
  end

  # def calc_alunos
  #   @alunos.each do |aluno|
  #     print ' '*13
  #     puts "#{aluno.matricula}"
  #     puts "#{aluno.historicos['NOTA']}"
  #     aluno.historicos do |v|
  #       puts "-#{v['NOTA']}-"
  #     end
  #   end
  # end


  def calcular_notas_por_matricula_e_curso
    notas_por_matricula_e_curso = {}
    @cursos.each do |curso|
      curso.alunos.each do |aluno|
        matricula = aluno["MATRICULA"]
        nota = aluno["NOTA"].to_i
        ch = aluno["CARGA_HORARIA"].to_i
        cod_disciplina = aluno["COD_DISCIPLINA"]

        notas_por_matricula_e_curso[matricula] ||= {}
        notas_por_matricula_e_curso[matricula][curso] ||= []

        notas_por_matricula_e_curso[matricula][curso] << {ch: ch, nota: nota, cod_disciplina: cod_disciplina}
      end
    end
    notas_por_matricula_e_curso
  end

  def calcular_media_por_matricula_e_curso
    notas_por_matricula_e_curso = calcular_notas_por_matricula_e_curso
    media_por_matricula_e_curso = {}

    notas_por_matricula_e_curso.each do |matricula, cursos|
      media_por_matricula_e_curso[matricula] = {}
      cursos.each do |curso, notas|
        total_notas = notas.sum { |nota_info| nota_info[:nota] * nota_info[:ch] }
        total_carga_horaria = notas.sum { |nota_info| nota_info[:ch] }

        media = total_notas / total_carga_horaria

        media_por_matricula_e_curso[matricula][curso] = media
      end
    end
    media_por_matricula_e_curso
  end

  def media_final
    media_por_curso = {}
    media_por_matricula_e_curso = calcular_media_por_matricula_e_curso
    media_por_matricula_e_curso.each do |_, cursos|
      cursos.each do |curso, media|
        media_por_curso[curso] ||= []
        media_por_curso[curso] << media
      end
    end
    media_por_curso
  end
end

