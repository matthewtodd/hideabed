Rake::TaskManager.class_eval do
  def remove_task(task_name)
    @tasks.delete(task_name.to_s)
  end
end

def remove_task(task_name)
  Rake.application.remove_task(task_name)
end

remove_task :test
task :test => 'test:units'

remove_task :default
task :default => ['test:units', 'features']
