class Audit < ApplicationRecord
    PRODUCT = "Product"
    USER = "User"
    SALE = "Sale"
    SALE_PRODUCT = "SaleProduct"
    STOCK = "Stock"
    CLIENT = "Client"
    MODULES = [PRODUCT, SALE, STOCK, CLIENT]
    CREATE = 'create'
    UPDATE = 'update'
    DESTROY = 'destroy'
    ACTIONS = [CREATE, UPDATE , DESTROY]

    def self.filter_users(opt)
        all_user_audits = self.all
        all_user_audits = all_user_audits.where(opt["auditable_id"])  if opt["auditable_id"].present?
        auditable_type
        user_id
        action
        created_at
    end    
end
