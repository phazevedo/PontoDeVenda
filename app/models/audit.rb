class Audit < Audited::Audit

    PRODUCT = "Product"
    USER = "User"
    SALE = "Sale"
    SALE_PRODUCT = "SaleProduct"
    STOCK = "Stock"
    CLIENT = "Client"
    CREATE = 'create'
    UPDATE = 'update'
    DESTROY = 'destroy'
    MODULES = [PRODUCT, SALE, STOCK, CLIENT]
    ACTIONS = [CREATE, UPDATE , DESTROY]
    MODULE_HASH = {
        PRODUCT => "Produto", 
        SALE => "Vendas", 
        STOCK => "Estoque", 
        CLIENT => "Cliente"
    }
    ACTION_HASH = {CREATE => "Criar", UPDATE => "Editar" , DESTROY => "Deletar"}

    def self.filter_users(opt = {})
        opt.merge(auditable_type: USER)
        self.filter(opt)
    end
    
    def self.filter(opt = {})
        audits = self.where(auditable_type: MODULES)
        if opt.present?
            audits = audits.where(auditable_id: opt["auditable_id"])  if opt["auditable_id"].present?
            audits = audits.where(auditable_type: opt["auditable_type"])  if opt["auditable_type"].present?
            audits = audits.where(user_id: opt["user_id"])  if opt["user_id"].present?
            audits = audits.where(action: opt["action"])  if opt["action"].present?
            audits = audits.where(created_at: opt["created_at"])  if opt["created_at"].present?
        end
        audits
    end

    def xpto
        binding.pry
        audited_changes
    end
end
