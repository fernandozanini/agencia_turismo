# frozen_string_literal: true

class Cliente < ApplicationRecord
  validates :nome, uniqueness: true
  validates :nome, presence: true
end
