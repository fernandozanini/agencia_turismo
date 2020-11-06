# frozen_string_literal: true

class Site < ApplicationRecord
  validates :nome, uniqueness: true
  validates :nome, presence: true
end
