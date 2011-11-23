module Abiquo

  class Platform

    @@base_dir = '/opt/abiquo'

    def self.rs_installed?
      File.directory? "#{@@base_dir}/tomcat/webapps/virtualfactory"
    end

    def self.server_installed?
      File.directory? "#{@@base_dir}/tomcat/webapps/server"
    end

    def self.v2v_installed?
      File.directory? "#{@@base_dir}/tomcat/webapps/bpm-async"
    end

    def self.version
      return nil if not File.exist?('/etc/abiquo-release')
      /Version:(.*)$/.match(File.read('/etc/abiquo-release'))[1].strip.chomp rescue nil
    end

  end

  class Config

    def self.write(node, destination='/opt/abiquo/config/abiquo.properties')
      File.open(destination, 'w') do |f|
        node['abiquo']['properties']['global'].each do |k,v|
          f.puts "#{k} = #{v}"
        end
        if Platform.rs_installed?
          node['abiquo']['properties']['rs'].each do |k,v|
            f.puts "#{k} = #{v}"
          end
        end
        if Platform.server_installed?
          node['abiquo']['properties']['server'].each do |k,v|
            f.puts "#{k} = #{v}"
          end
        end
      end
    end

  end

end

