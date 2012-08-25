require 'rubygems'
require 'zlib'
require 'archive/tar/minitar'

require 'blimpy/livery/cwd'
require 'blimpy/livery/puppet'

module Blimpy
  module Livery
    def self.tarball_directory(directory)
      if directory.nil? || !(File.directory? directory)
        raise ArgumentError, "The argument '#{directory}' doesn't appear to be a directory"
      end

      directory = File.expand_path(directory)
      short_name = File.basename(directory)

      tarball = nil
      Dir.chdir(File.expand_path(directory  + '/../')) do
        tarball = self.gzip_for_directory(short_name, '/tmp') do |tgz|
          Archive::Tar::Minitar.pack(short_name, tgz)
        end
      end
      tarball
    end

    private

    def self.gzip_for_directory(directory, root)
      filename = File.join(root, "#{directory}.tar.gz")
      yield Zlib::GzipWriter.new(File.open(filename, 'wb'))
      filename
    end

  end
end
