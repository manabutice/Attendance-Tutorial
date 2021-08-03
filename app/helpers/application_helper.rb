module ApplicationHelper
	
    def title(page_name)
    	base_title = "勤怠B"
    	if page_name.empty?
    		base_title
    	else
    		page_name + "｜" + base_title
    	end
    end

    
end