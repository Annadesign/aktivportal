module Admin::TagsHelper
	def create_deletable_button tag
		if tag.in_use?
			link_to "#" do 
				content_tag(:button, 'Slett', :class => 'btn btn-sm btn-outlined')
			end
		else
			link_to admin_tag_path(tag), method: :delete do 
				content_tag(:button, 'Slett', :class => 'btn btn-sm btn-danger')
			end 			
		end
	end
end
		