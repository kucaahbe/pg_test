#!/usr/bin/env ruby
require 'rubygems'
require 'bundler/setup'
require 'active_record'
require 'pg'

PGconn.connect(
  :host     => "localhost",
  :user     => "user",
  :password => "user",
  :dbname   => "dbname"
)

res = conn.exec( "select * from pg_stat_activity" )
p res.values

# trace:
# ./failing_app.rb:7: [BUG] Segmentation fault
# ruby 1.9.2p180 (2011-02-18 revision 30909) [i686-linux]
# 
# -- control frame ----------
#   c:0005 p:---- s:0013 b:0013 l:000012 d:000012 CFUNC  :initialize
# c:0004 p:---- s:0011 b:0011 l:000010 d:000010 CFUNC  :new
# c:0003 p:0081 s:0007 b:0007 l:000d0c d:001d10 EVAL   ./failing_app.rb:7
# c:0002 p:---- s:0004 b:0004 l:000003 d:000003 FINISH
# c:0001 p:0000 s:0002 b:0002 l:000d0c d:000d0c TOP   
# ---------------------------
#   -- Ruby level backtrace information ----------------------------------------
#   ./failing_app.rb:7:in `<main>'
#   ./failing_app.rb:7:in `new'
# ./failing_app.rb:7:in `initialize'
# 
# -- C level backtrace information -------------------------------------------
#   /home/kuca/.rvm/rubies/ruby-1.9.2-p180/lib/libruby.so.1.9(rb_vm_bugreport+0x72) [0xb77e4ac2]
# /home/kuca/.rvm/rubies/ruby-1.9.2-p180/lib/libruby.so.1.9(+0x56271) [0xb76be271]
# /home/kuca/.rvm/rubies/ruby-1.9.2-p180/lib/libruby.so.1.9(rb_bug+0x3a) [0xb76be36a]
# /home/kuca/.rvm/rubies/ruby-1.9.2-p180/lib/libruby.so.1.9(+0x10851c) [0xb777051c]
# [0xb785940c]
# [(nil)]
# [0x41]
# 
# [NOTE]
# You may have encountered a bug in the Ruby interpreter or extension libraries.
#   Bug reports are welcome.
#   For details: http://www.ruby-lang.org/bugreport.html
# 
# zsh: abort      ./failing_app.rb

