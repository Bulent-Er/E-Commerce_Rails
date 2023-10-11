module Cache
  module RedisCache
    def read_cache
      if Rails.cache.exist?("#{request.fullpath}")
        @cached_data = Rails.cache.read("#{request.fullpath}")
        @is_cached = true
        render "api/#{controller_name}/#{action_name}"
      else
        @is_cached = false
      end
    end
    def remove_cache
        Rails.cache.delete("/api/#{controller_name}")
        Rails.cache.delete("#{request.fullpath}")
    end

    def write_cache(entity)
      Rails.cache.write( "#{request.fullpath}", entity, expires_in: 60.minutes)
    end
  end
end