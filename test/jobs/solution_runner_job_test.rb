require 'test_helper'

class SolutionRunnerJobTest < ActiveJob::TestCase
  test "checks a submitted solution" do
    begin
      original_mktmpdir = Dir.method(:mktmpdir)
      original_write = File.method(:write)

      Dir.class_eval <<~RUBY
        def self.mktmpdir
          yield '/tmp/tmpdir1'
        end
      RUBY

      calls = 0
      File.define_singleton_method(:write) do |path, content|
        calls += 1
        case calls
        when 1
        when 2
        end
      end

      Dir.define_singleton_method(:chdir) do |path|
        raise if path != '/tmp/tmpdir1'
      end

      Kernel.define_singleton_method('`') do |command|
        raise if command != 'true'
      end

      solution = solutions(:test)
      SolutionRunnerJob.perform_now(solution)
    ensure
      Dir.define_singleton_method(:mktmpdir, original_mktmpdir)
      File.define_singleton_method(:write, original_write)
    end
  end
end
