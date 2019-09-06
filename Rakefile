require "rubygems"
require "hoe"


def platform
  ENV.key?("MRI") ? "mri" : "jruby"
end

def java_driver?
  platform == "jruby"
end

def ffi?
  !java_driver?
end

def other_platform(platform)
  platform == 'jruby' ? 'mri' : 'jruby'
end

### Custom files and adding them to Manifest
File.open("Manifest.txt", "r+") do |manifest|
  File.open("Manifest_temp.txt", "w") do |temp|
    [manifest.readlines(chomp: true), Dir.glob(File.join("#{platform}_code", "**", "*.rb"))]
        .flatten.uniq.reject{ |path| path.match?(other_platform(platform)) }.each { |path|
      temp.puts(path) }
  end
end
FileUtils.mv("Manifest_temp.txt", "Manifest.txt", force: true)
####


Hoe.spec "using_sow" do |s|

  s.developer("Leszek Kalwa", "lj.kalwa@gmail.com")
  s.name = "#{name}_gem"
  s.urls = "http://example.com/lkalwa"

  s.testlib = :rspec

  s.extra_dev_deps += [
      ['ffaker'],
      ['neo4j-rake_tasks', '>= 0.3.0'],
      ['parallel'],
      ['rspec-its']
  ]

  s.extra_deps += [
      ['activesupport'],
      ['zeitwerk']
  ]

  if ffi?
    s.extra_dev_deps += [
        ['ffi'],
        ['recursive-open-struct']
    ]
  else
    s.extra_dev_deps += [['ruby-maven']]
    s.extra_deps += [['jar-dependencies']]
    s.spec_extras = {
        requirements: -> (requirements) { requirements  << 'jar org.neo4j.driver, neo4j-java-driver, 1.7.5' }
    }
  end


end


# vim: syntax=ruby
