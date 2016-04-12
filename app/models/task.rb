class Task < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :test, presence: true
  validates :true_command, presence: true
end
