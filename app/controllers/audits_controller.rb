class AuditsController < ApplicationController
    before_action :authenticate_admin!

    def index
        render layout: false        
    end

    def users_report

        render layout: false
    end
    
    def modules_report

        @modules = {"Produto" => "Product", 
                    "Clientes"=> "Client" ,
                    "Vendas"=> "Sale" 
                }

        @actions = {
            "Criar"=> "create",
            "Atualizar" => "update",
            "Deletar" => "destroy"
        }
        @audits = Audit.filter(params["filter"])
        render layout: false        
    end
end