require 'rake'
require 'parallel'
require 'cucumber/rake/task'
require 'yaml'

Cucumber::Rake::Task.new(:cukesingle) do |task|
  ENV['CONFIG_NAME'] ||= "single"
  task.cucumber_opts = ["--format=pretty -f json -o results.json", 'features/single.feature']
end

task :default => :single

Cucumber::Rake::Task.new(:local) do |task|
  task.cucumber_opts = ["--format=pretty -f json -o results.json", 'features/local.feature', 'CONFIG_NAME=local']
end

task :single, [:device] do |task,args|
        device = (args[:device] || "").gsub(' ','_')
        cuke_task = Cucumber::Rake::Task.new
        cuke_task.cucumber_opts = ["--format=pretty -f json -o device_#{device}.json", 'features/single.feature']
        cuke_task.runner.run
end

task :parallel do |t, args|
  @num_parallel = 2

  Parallel.map([*1..@num_parallel], :in_processes => @num_parallel) do |task_id|
    ENV["TASK_ID"] = (task_id - 1).to_s
    ENV['name'] = "parallel_test"
    ENV['CONFIG_NAME'] = "parallel"

        TASK_ID = (ENV['TASK_ID'] || 0).to_i
        CONFIG_NAME = ENV['CONFIG_NAME']
        CONFIG = YAML.load(File.read(File.join(File.dirname(__FILE__), "./config/#{CONFIG_NAME}.config.yml")))
        caps = CONFIG['browser_caps'][(task_id-1)]
        ENV['DEVICE'] = caps['device']

    Rake::Task["single"].invoke(caps['device'])
    Rake::Task["single"].reenable
  end
end

task :test do |t, args|
  Rake::Task["single"].invoke
  Rake::Task["single"].reenable
  Rake::Task["local"].invoke
  Rake::Task["parallel"].invoke
end
