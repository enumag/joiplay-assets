# frozen_string_literal: true

require_relative 'English'
require_relative 'delegate'
require_relative 'singleton'
require_relative 'tempfile'
require_relative 'fileutils'
# require 'stringio'
# require 'zlib'
require_relative 'zip/version'
require_relative 'zip/constants'
require_relative 'zip/dos_time'
require_relative 'zip/ioextras'
# require 'rbconfig'
require_relative 'zip/entry'
require_relative 'zip/extra_field'
require_relative 'zip/entry_set'
require_relative 'zip/central_directory'
require_relative 'zip/file'
require_relative 'zip/input_stream'
require_relative 'zip/output_stream'
require_relative 'zip/decompressor'
require_relative 'zip/compressor'
require_relative 'zip/null_decompressor'
require_relative 'zip/null_compressor'
require_relative 'zip/null_input_stream'
require_relative 'zip/pass_thru_compressor'
require_relative 'zip/pass_thru_decompressor'
require_relative 'zip/crypto/decrypted_io'
require_relative 'zip/crypto/encryption'
require_relative 'zip/crypto/null_encryption'
require_relative 'zip/crypto/traditional_encryption'
require_relative 'zip/crypto/aes_encryption'
require_relative 'zip/inflater'
require_relative 'zip/deflater'
require_relative 'zip/streamable_stream'
require_relative 'zip/streamable_directory'
require_relative 'zip/errors'

# Rubyzip is a ruby module for reading and writing zip files.
#
# The main entry points are File, InputStream and OutputStream. For a
# file/directory interface in the style of the standard ruby ::File and
# ::Dir APIs then `require 'zip/filesystem'` and see FileSystem.
module Zip
  extend self

  attr_accessor :unicode_names,
                :on_exists_proc,
                :continue_on_exists_proc,
                :sort_entries,
                :default_compression,
                :write_zip64_support,
                :warn_invalid_date,
                :case_insensitive_match,
                :force_entry_names_encoding,
                :validate_entry_sizes

  DEFAULT_RESTORE_OPTIONS = {
    restore_ownership:   false,
    restore_permissions: true,
    restore_times:       true
  }.freeze # :nodoc:

  # :nodoc:
  # Remove this when JRuby#3962 is fixed.
  ZLIB_FLUSHING_STRATEGY = defined?(JRUBY_VERSION) ? Zlib::SYNC_FLUSH : Zlib::NO_FLUSH

  def reset! # :nodoc:
    @_ran_once = false
    @unicode_names = false
    @on_exists_proc = false
    @continue_on_exists_proc = false
    @sort_entries = false
    @default_compression = Zlib::DEFAULT_COMPRESSION
    @write_zip64_support = true
    @warn_invalid_date = true
    @case_insensitive_match = false
    @force_entry_names_encoding = nil
    @validate_entry_sizes = true
  end

  # Set options for RubyZip in one block.
  def setup
    yield self unless @_ran_once
    @_ran_once = true
  end

  reset!
end

# Copyright (C) 2002, 2003 Thomas Sondergaard
# rubyzip is free software; you can redistribute it and/or
# modify it under the terms of the ruby license.
