# frozen_string_literal: true

class Sidebar::ChecklistComponent < ViewComponent::Base
  def initialize(checklist:)
    @checklist = checklist
  end
end
