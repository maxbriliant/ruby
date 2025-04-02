#!/usr/bin/ruby

name_dirty = `cat /etc/os-release | grep NAME `
p name_cleaner = name_dirty.scan(/"([^"]*)"/).uniq[0][0]

