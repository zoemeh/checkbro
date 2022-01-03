# frozen_string_literal: true

class Sidebar::CreateChecklistComponent < ViewComponent::Base
  def initialize
    @checklist = Checklist.new
  end
end
