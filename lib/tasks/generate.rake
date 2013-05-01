namespace :lui do
  task :generate do
    Lui::Logger.log Lui::ERB.render(:post, {})
  end
end