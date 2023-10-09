class Curso
  attr_accessor :cod_curso, :alunos
  def initialize(cod_curso, alunos)
    @cod_curso = cod_curso
    @alunos = alunos
  end
end
