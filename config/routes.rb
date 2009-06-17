ActionController::Routing::Routes.draw do |map|
  map.with_options(:format => 'json') do |json|
    json.with_options(:controller => 'databases') do |databases|
      databases.connect '/_all_dbs', :action => 'index', :conditions => { :method => :get }
    end
  end
end
