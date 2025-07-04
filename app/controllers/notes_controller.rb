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

  def update_file_content
    filename = params[:filename]
    content = params[:content]
    file_path = Rails.root.join("notes", filename)
    if File.exist?(file_path)
      File.write(file_path, content)
      flash[:notice] = "Note saved!"
    else
      flash[:alert] = "File not found."
    end
    redirect_to root_path(selected: filename)
  end

  def create_new_note
    filename = Time.now.strftime("%Y%m%d%H%M%S") + ".md"
    file_path = Rails.root.join("notes", filename)
    File.write(file_path, "")
    flash[:notice] = "New note created!"
    redirect_to root_path(selected: filename)
  end

  def file_content
    filename = params[:filename]
    file_path = Rails.root.join("notes", filename)
    if File.exist?(file_path)
      content = File.read(file_path)
      render plain: content
    else
      render plain: "File not found", status: :not_found
    end
  end
end
