class ChecklistItem < ApplicationRecord
  belongs_to :checklist

  def done?
    is_done
  end
end
