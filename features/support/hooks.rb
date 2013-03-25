Before do
  @config = IO.read(Rails.root.to_s+"/config/admin.yml")
end

After do
  File.open(Rails.root.to_s+"/config/admin.yml", "w") do |file|
    file.puts @config
  end
end
