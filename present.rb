#!/usr/bin/env ruby

require 'io/console'

msg = ARGV.shift or fail "no message text given"

rows, cols = IO.console.winsize

msg_lines = msg.lines.count

vert_padding    = "\n" * ((rows - msg_lines) / 2)
extra_padding   = "\n" unless ((rows - msg_lines) % 2).zero?
extra_padding ||= ""

msg_line = lambda { |l|
  # line_length excludes any ANSI formatting codes
  line_length = l.chomp.gsub(/\e\[(\d+)(;\d+)*m/, '').size
  padding = " " * ((cols - line_length) / 2)
  padding << l.chomp
}

print vert_padding +
      msg.lines.map { |l| msg_line.(l) }.join("\n") +
      vert_padding +
      extra_padding

char = IO.console.getch
case char
when "q"
  exit 1
when "\e"
  # left arrow handling
  IO.console.getch
  exit 1 if IO.console.getch == "D"
when "Q"
  exit 99
end
