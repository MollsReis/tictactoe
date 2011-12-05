require 'rubygems'
require 'bundler/setup'

require File.join(File.dirname(__FILE__),'..','lib','tic_tac_toe.rb')
Bundler.require(:test)
