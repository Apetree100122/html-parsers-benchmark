require 'nokogiri'

def do_time_test(fn, n, enable_xpath = true)
  start = Time.now
  links = []
  n.times do
    tree = File.open(fn) { |f| Nokogiri::HTML(f) }
    tree.root

    if enable_xpath
      links = tree.root.xpath('//a')
    end
  end
  stop = Time.now

  puts "#{stop - start} s"
  puts "#{links.size} links" if enable_xpath
end

enable_xpath = false
if ARGV.size > 2 and ARGV[2] =~ /true/
  enable_xpath = true
end

do_time_test(ARGV[0], ARGV[1].to_i, enable_xpath)
