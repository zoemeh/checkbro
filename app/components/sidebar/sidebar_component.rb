# frozen_string_literal: true

class Sidebar::SidebarComponent < ViewComponent::Base
  def initialize(active: nil, checklists:)
    @checklists = checklists
    @active = active
  end
end
