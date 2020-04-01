["鵜住居小学校","大沢小学校","新里小学校","山口小学校"].each do |name|
    AssignedSchool.create!(
      {name: name}
    )
end