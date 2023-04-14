class Employee < ApplicationRecord
  belongs_to :department, required: false
  has_one_attached :image
  has_many_attached :pictures
  has_many :subordinates, class_name: "Employee",
                          foreign_key: "manager_id"
  belongs_to :manager, class_name: "Employee", optional: true
  validates :name, presence: true
  validates :age, numericality: { only_integer: true }, comparison: { greater_than: 17 }
end
