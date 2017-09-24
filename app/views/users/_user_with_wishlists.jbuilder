json.extract! user, :id,
                    :instragram_url,
                    :pintrest_url,
                    :tag_line,
                    :full_name,
                    :email,
                    :location_id,
                    :location_name,
                    :profile_pic

json.wishlists user.wishlists do |wishlist|
  json.(wishlist, :id, :user_id, :description, :location_id, :location_name, :due_date)
end
