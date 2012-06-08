module Jekyll
  class Post
    alias_method :pre_initialize, :initialize
    
    def initialize(site, source, dir, name)
      pre_initialize(site, source, dir, name)
      if site.config['no_schedule']
        site.config['next_build'] = nil
        return
      end
      if self.data.has_key?('no_schedule') && self.data['no_schedule'] == true
        return
      end
      if (Time.new <=> self.date) < 0
        if self.published
          next_build = site.config['next_build']
          if next_build == nil or (next_build <=> self.date) > 0
            site.config['next_build'] = self.date
          end
          site.config['next_build']
        end
        self.published = false
      end
    end
  end

  class ScheduleBuildGenerator < Generator
    def generate(site)
      next_build = site.config['next_build']
      date_file = File.join(site.dest, 'next_build.txt')
      if !(next_build == nil)
        f = File.new(date_file, 'w')
        f.write(next_build.strftime("%s"))
        f.close
        site.static_files << Jekyll::StaticFile.new(site, site.dest, '', 'next_build.txt')
      end
    end
  end
end
