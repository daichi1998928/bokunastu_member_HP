class SearchController < ApplicationController
  before_action :authenticate_user!

  def search
   if params[:narrow_university_branch].present?
      name = params[:narrow_university_branch]
      university_branch = UniversityBranch.find_by(name: "#{name}")
      @members = university_branch.users
        if params[:narrow_title_of_branch].present?
          title_of_branch_name = params[:narrow_title_of_branch]
          title_of_branch_id = TitleOfBranch.find_by(name: title_of_branch_name).id
          @members = @members.where(title_of_branch_id: title_of_branch_id)
        end
   elsif params[:narrow_assigned_school].present?
    name = params[:narrow_assigned_school]
    school = AssignedSchool.find_by(name: "#{name}")
    @members = school.users
      if params[:narrow_title_of_branch].present?
        title_of_branch_name = params[:narrow_title_of_branch]
        title_of_branch_id = TitleOfBranch.find_by(name: title_of_branch_name).id
        @members = @members.where(title_of_branch_id: title_of_branch_id)
      end
    elsif params[:narrow_title_of_branch].present?
      name = params[:narrow_title_of_branch]
      title = TitleOfBranch.find_by(name: name)
      @members = title.users
    end
    # @model = params["search"]["model"]
    # @content = params["search"]["keyword"]

    # # @users = search_by_model(@model, @content)
    # @users = search_for(@content)
  end

  private
  def search_by_model(model, content)
    members = []
    if model = "skill"
      Skill.where("content LIKE(?)", "%#{content}%").each do |f|
        members << f.user
      end
      members = members.uniq
      binding.pry
      return members
    elsif model = 'hobby'
      Hobby.where("content LIKE(?)", "%#{content}%").each do |f|
        members << f.user
      end
      members.uniq
      return members
    elsif model = "challenging"
      Challenging.where("content LIKE(?)", "%#{content}%").each do |f|
        members << f.user
      end
      members.uniq
      return members
    end
  end

  def search_for(content)
    users = []
    test = Skill.where("content LIKE(?)", "%#{content}%").or(Hobby.where("content LIKE(?)", "%#{content}%")).or(Challenging.where("content LIKE(?)", "%#{content}%"))
    test.each do |f| 
       users << f.user 
    end
     users = users.uniq
     return users
  end
  
end
