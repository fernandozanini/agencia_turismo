class FormaPagamento < ApplicationRecord
    validates :nome, uniqueness: true
    validates :nome, presence: true
end
