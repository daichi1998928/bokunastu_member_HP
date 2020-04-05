class SearchController < ApplicationController
  before_action :authenticate_user!

  def search_narrow
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

    render :search
  end
  

  def search   
    if params["search"]["model"].present?
      search_object = params["search"]["model"]
      keyword = params["search"]["keyword"]
      members = []
      if search_object == "趣味"
        Hobby.where("content LIKE(?)", "%#{keyword}%").each do |f|
          members << f.user
        end
        @members = members.uniq
        return @members
      elsif search_object == '挑戦したいこと'
        Challenging.where("content LIKE(?)", "%#{keyword}%").each do |f|
          members << f.user
        end
        @members = members.uniq
        return @members
      elsif search_object == "故郷"
        @members = User.where("birthplace LIKE(?)", "%#{keyword}%")
        return @members
      elsif search_object == "興味"
        Interest.where("content LIKE(?)", "%#{keyword}%").each do |f|
          members << f.user
        end
        @members = members.uniq
        return @members      
      elsif search_object == "名前orニックネーム"
        @members = User.where("name LIKE(?)", "%#{keyword}%").or(User.where("nickname LIKE(?)", "%#{keyword}%"))
        return @members
      elsif search_object == "学部学科"
        @members = User.where("faculty LIKE(?)", "%#{keyword}%")
        return @members
      end
    end
  end

  
  
  
end
