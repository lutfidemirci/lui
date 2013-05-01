namespace :lui do
  task :clear do
    Lui::System.run "rm -rf web/*"
    Lui::Logger.log "Web folder deleted."
    redis.del('lui:slugs')
    redis.del('lui:sorted-slugs')
    Lui::Logger.log "Redis lui:slugs/lui:sorted-slugs deleted."
  end
end

def redis
  Lui.redis
end