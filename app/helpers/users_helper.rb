module UsersHelper
  def display_name(candidate)
    "#{candidate.name}(#{candidate.party})"
  end
end

#duck typing ,不管傳進來的是不是candidate物件，只要傳進來的物件有name、party這兩個方法，
#這模組就能正常運作