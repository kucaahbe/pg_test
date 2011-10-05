#!/usr/bin/env ruby
require 'rubygems'
require 'bundler/setup'
#require 'active_record'
require 'pg'

PGconn.connect(
  :host     => "localhost",
  :user     => "user",
  :password => "user",
  :dbname   => "dbname"
)

res = conn.exec( "select * from pg_stat_activity" )
p res.values
