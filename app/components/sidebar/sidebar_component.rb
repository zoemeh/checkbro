# frozen_string_literal: true

class Sidebar::SidebarComponent < ViewComponent::Base
  def initialize(checklists:)
    @checklists = checklists
  end

end
