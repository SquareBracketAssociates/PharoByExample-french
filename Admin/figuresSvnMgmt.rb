#!/usr/bin/env ruby
# goal: replace pdf by png in the book's subversion
# author: martial boniou
#
require 'rubygems'
require 'rush'

case ARGV.size
  when 0 then raise ArgumentError
end

class String
  def end_replace(str1, str2)
    self[0..-str1.length-1]+str2
  end
end

pre_path = ''
if ARGV[0] !~ /^\//
  pre_path = Dir.pwd+'/'
end

module SvnBox
  def bash_command(args, command, opt, info)
    # args: Array of arguments for svn (ex: ["zorg.txt" "-m" "my message"])
    # opt:  String for svn option (ex: "commit")
    # info: String for message info sent if exception thrown
    begin
      self.bash "#{command} #{opt} " + args.join(' ')
    rescue Rush::BashFailed => e
      puts "Failed to #{info} using #{command}: #{e.message}"
    end
  end
  def svn_command(args, opt, info)
    self.bash_command(args, 'svn', opt, info)
  end
  def svn_add(args, content_info)
    self.svn_command(args, 'add', 'add '+content_info)
  end
  def svn_del(args, content_info, force_flag=false)
    delete_option='del'
    delete_option+=' --force' if force_flag
    self.svn_command(args, delete_option, 'delete '+content_info)
  end
  protected :bash_command, :svn_command
end
box = Rush::Box.new.extend(SvnBox)

sel_pdfs = Rush[pre_path+ARGV[0]]['**/figures/*.pdf'].select {|f| Rush[f.full_path.end_replace('df','ng')].exists? } # select a pdf if a png replacement file exists
!sel_pdfs.empty? && begin
  puts "Process..."
  pdfs = sel_pdfs.map {|e| e.full_path}
  pngs = pdfs.map {|e| e.end_replace('df', 'ng')}
  puts pngs
  box.svn_add(pngs, 'PNG files')
  box.svn_del(pdfs, 'PDF files', true)
end

#begin
#  box.bash 'svn del --force ' + pdf
#rescue Rush::BashFailed => e
#  puts "Failed to delete PDFs to repository: #{e.message}"
#end

#begin
#  box.bash 'svn add '
#rescue Rush::BashFailed => e
#  puts "Failed to add PNGs to repository: #{e.message}"
#end

