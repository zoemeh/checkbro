class Checklist < ApplicationRecord
  validates :title, uniqueness: true, presence: true
  has_many :checklist_items, dependent: :delete_all
  accepts_nested_attributes_for :checklist_items, :allow_destroy => true

  def items
    checklist_items
  end

  def items=(v)
    checklist_items = v
  end
end
