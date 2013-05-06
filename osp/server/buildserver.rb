#!/usr/bin/ruby
# Simple LaTeX-Build server

file = "open_science_paper.Rnw"
cmd = "make"

class String
  def mtime
    File.new(self).mtime
  end
end

lastmtime = file.mtime

while true
  currentTime = file.mtime
  if (currentTime > lastmtime) then
    print "file modified at " + currentTime.to_s
    lastmtime = currentTime
    print "Compiling " + file + "\n"
    system cmd
  end
  print ". "
  sleep 1
end
