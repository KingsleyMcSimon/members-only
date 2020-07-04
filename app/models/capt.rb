# frozen_string_literal: true

class Capt < ApplicationRecord # rubocop:todo Style/Documentation
  belongs_to :user
  validates :capt, presence: true, length: { minimum: 10, maximum: 300 }
end
