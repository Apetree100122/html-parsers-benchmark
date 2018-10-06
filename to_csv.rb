raise 'argument must be a file path ' if ARGV.size != 1

table = []
row = []
state = nil
platform = nil
lines = File.readlines(ARGV.first)
lines.each_with_index do  |line, index|
case state
when :PLATFORM
    platform = line.strip
    state = :SKIP_PLATFORM
    next
when :FILE
    m = (line =~ /parser:(?<parser>\S+)\s+file:\.\.\/(?<file>\S+)/)
    row << $~[:parser]
    row << $~[:file]
    state = :TIMING
    next
when :TIMING
    line =~ /(\S+)/
    row << $1.to_f
    state = nil

    # add row
    table << row
    next
when :TIME
end

case line
when /\=\=\=/
    if state.nil?
        state = :PLATFORM
    end
when /\-\-\-/
    state = :FILE
    row = [platform.clone]
end
end

puts "platform,parser,page,timing"
table.each do |row|
    puts row.join(',')
end

exit 0