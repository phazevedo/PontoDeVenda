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
        opt.merge(auditable_type: USER)
        self.filter(opt)
    end
    
    def self.filter(opt)
        audits = audits.where(opt["auditable_id"])  if opt["auditable_id"].present?
        audits = audits.where(opt["auditable_type"])  if opt["auditable_type"].present?
        audits = audits.where(opt["user_id"])  if opt["user_id"].present?
        audits = audits.where(opt["action"])  if opt["action"].present?
        audits = audits.where(opt["created_at"])  if opt["created_at"].present?
        audits
    end
end
