class SearchController < ApplicationController
  before_action :authenticate_user!

  def search
    binding.pry
    # @model = params["search"]["model"]
    @content = params["search"]["keyword"]

    # @users = search_by_model(@model, @content)
    @users = search_for(@content)
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
