namespace :lui do
  task :parse do

    Dir['posts/*.markdown'].each do |path|
      matches = path.match(/\/(\d{4})-(\d{2})-(\d{2})-([\w\-]+)\.markdown$/)

      temp_slug = matches[4]
      slug = temp_slug
      i = 2
      while redis.hexists('lui:slugs', slug)
        slug = temp_slug + "-#{i}"
      end

      content = File.open(path).read

      meta = {
        "slug" => slug,
        "title" => Lui::Helper.capitalize_words(temp_slug.gsub("-", " ")),
        "published_at" => Date.new(matches[1].to_i, matches[2].to_i, matches[3].to_i).to_time.utc.to_i
      }

      if result = content.match(/\A(---\s*\n.*?\n?)^(---\s*$\n?)/m)
        content = content[(result[0].length)...(content.length)]
        meta.merge!(YAML.safe_load(result[0]))
      end

      meta["html"] = Lui::Markdown.render(content)

      redis.hset('lui:slugs', slug, MultiJson.dump(meta))
      redis.zadd('lui:sorted-slugs', meta[:published_at], slug)
      Lui::Logger.log "Imported #{slug}."
    end

  end
end

def redis
  Lui.redis
end
