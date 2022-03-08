class AddDefaultImagesToStaticPages < ActiveRecord::Migration[5.1]
  def up
  	if AboutUs.count >= 1
  		AboutUs.first.update(image: Rails.root.join("app/assets/images/photos/4.png").open)
  	end
  	if HomeStaticText.count >= 1
  		HomeStaticText.first.update(image: Rails.root.join("app/assets/images/photos/1.png").open)
  	end
  end

  def down
  end
end
