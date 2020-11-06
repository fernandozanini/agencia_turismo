class Empresa < ApplicationRecord
    validates :nome, uniqueness: true
    validates :nome, presence: true
end
