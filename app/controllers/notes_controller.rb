class NotesController < ApplicationController
  def index
    @files = Dir.children(Rails.root.join("notes"))
    @selected = params[:selected]
    if @selected.present?
      file_path = Rails.root.join("notes", @selected)
      @selected_file_content = File.exist?(file_path) ? File.read(file_path) : ""
    else
      @selected_file_content = ""
    end
  end
end
