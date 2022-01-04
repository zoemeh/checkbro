# frozen_string_literal: true

class Sidebar::ChecklistComponent < ViewComponent::Base
  attr_reader :checklist
  def initialize(active: false, checklist:)
    @checklist = checklist
    @active = active
  end
end
