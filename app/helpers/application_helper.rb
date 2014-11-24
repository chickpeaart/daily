module ApplicationHelper

#nous avons donc un helper customisé qui va nous permetre de lancer le partial.  
def error_message_for(object)
	render(:partial => 'application/error_messages', :locals =>{:object=> object})
end

end
