module AdminHelper
  def store_admin(admin)
    @admin = admin
  end

  def return_admin
    @admin
  end

  def set_up_external_config(admin)
    @config_file = Rails.root.to_s+'/config/admin.yml'

    if File.exists?(@config_file)
      @config = IO.read(@config_file)
    else
      @config = nil
      File.new(@config_file, "w")
    end

    File.open(@config_file, "w") do |file|
      file.puts "---" 
      file.puts "!ruby/sym username: #{ admin.username }"
      file.puts "!ruby/sym password: #{ admin.password }"
    end
  end

  def tear_down_external_config
    if @config 
      File.open(@config_file, "w") { |file| file.puts @config }
    end
  end
end
