module ApplicationHelper
    def retornar_sim_nao(valor)
        retorno = 'Não'
        retorno = 'Sim' if valor
        retorno
    end
end
