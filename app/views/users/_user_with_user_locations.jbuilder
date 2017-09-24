json.extract! user, :id,
                    :instragram_url,
                    :pintrest_url,
                    :tag_line,
                    :full_name,
                    :email,
                    :location_id,
                    :location_name,
                    :profile_pic

json.user_locations user.user_locations do |user_location|
  json.(user_location, :id, :start_time, :end_time, :user_id, :location_id, :location_name)
end
