# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @checklists = Checklist.order(:id)
  end

  # GET /sidebar
  def sidebar
    respond_to do |format|
      format.html {
        render Sidebar::SidebarComponent.new(checklists: Checklist.order(:id))
      }
    end
  end
  # GET /sidebar/checklist/new
  def sidebar_new_checklist
    respond_to do |format|
      format.html
    end
  end

  # POST /sidebar/checklist/new
  def sidebar_create_checklist
    @checklsit = Checklist.create(params.require(:checklist).permit(:title))
    respond_to do |format|
      format.turbo_stream do
        stream = turbo_stream.replace(:sidebar_checklists,
                                      Sidebar::SidebarComponent.new(checklists: Checklist.order(:id)).render_in(view_context))
        render turbo_stream: stream
      end
    end
  end
end
