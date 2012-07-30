class SubmittedWorksController < ApplicationController
  def new
    @work = SubmittedWork.new
  end
   
  def update
    @works = SubmittedWork.where("user_id = ?", current_user.id)
    @works.each do |work|
      if work.file_name.nil?
        @work = work
        break
      end  
    end
    
    if (@work.nil?)
      flash[:error] = "New Submissions cannot be made!"
      redirect_to :controller => 'user_tasks', :action => 'index' 
    else
    
    filename = params[:filename]
    result_hash = search_by_title(filename)
    file_url = result_hash['items'][0]['alternateLink']
    file_id = result_hash['items'][0]['id']
    result = insert_permission(file_id)
    if result == 200
      @work.update_attributes(:file_name => filename, :submitted_link => file_url)
    else
      flash[:notice] = "File permissions could not be set!"
    end
    redirect_to :controller => 'user_tasks', :action => 'index' 
    
  end
  end
  
  def search_by_title(filename)
    # search for apostrophe's in filename and preceed it with "\\"
    # otherwise it would result in a 400 error
    new_filename = filename.gsub(/\'/, "\\\\'")

    parameters = { 'q' => "title = '#{new_filename}'" } 
    result = client.execute(:api_method =>drive.files.list,
                             :parameters => parameters)
    if result.status == 200
      result_hash = result.data.to_hash
      result_hash
    else
      flash[:notice] = "File search failed"
    end
  end
  
  def insert_permission(file_id)
    new_permission = drive.permissions.insert.request_schema.new({
      'role' => "reader",
      'type' => "anyone",
      'value' => "",
      'additionalRoles' => ["commenter"],
      'withLink' => true })
    result = client.execute(
      :api_method => drive.permissions.insert,
      :body_object => new_permission,
      :parameters => { 'fileId' => file_id })
    result.status
  end
  
  def submit_filename
  end
  
  def list
    @user_tasks = SubmittedWork.where("user_id = ?", current_user.id)
  end
  
  def destroy
  end
end
