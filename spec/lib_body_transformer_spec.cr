require "./spec_helper"

private def assert_transform(header, input, output, file = __FILE__, line = __LINE__)
  it "transforms #{input.inspect} in #{header.inspect}", file: file, line: line do
    nodes = parse(File.read("#{__DIR__}/headers/#{header}.h"))
    transformer = LibBodyTransformer.new(nodes)

    lib_def = Crystal::Parser.parse(%(
      lib LibSome
        #{input}
      end
    )) as Crystal::LibDef
    lib_def.body = transformer.transform(lib_def.body)
    join_lines(lib_def.to_s).should eq(join_lines("lib LibSome\n#{output}\nend"))
  end
end

private def join_lines(string)
  string.split("\n").map(&.strip).reject(&.empty?).join("\n")
end

describe LibBodyTransformer do
  assert_transform("pcre",
    "INFO_CAPTURECOUNT = PCRE_INFO_CAPTURECOUNT",
    "INFO_CAPTURECOUNT = 2"
  )

  assert_transform("pcre",
    "fun compile = pcre_compile",
    %(
    type Pcre = Void*
    fun compile = pcre_compile(x0 : LibC::Char*, x1 : LibC::Int, x2 : LibC::Char**, x3 : LibC::Int*, x4 : LibC::UInt8*) : Pcre
    )
  )

  # Check that it only declares the Pcre type once
  assert_transform("pcre",
    %(
    fun compile = pcre_compile
    fun get_stringnumber = pcre_get_stringnumber
    ),
    %(
    type Pcre = Void*
    fun compile = pcre_compile(x0 : LibC::Char*, x1 : LibC::Int, x2 : LibC::Char**, x3 : LibC::Int*, x4 : LibC::UInt8*) : Pcre
    fun get_stringnumber = pcre_get_stringnumber(x0 : Pcre, x1 : LibC::Char*) : LibC::Int
    )
  )

  [
    {"void", "Void"},
    {"int", "LibC::Int"},
    {"short", "LibC::Short"},
    {"char", "LibC::Char"},
    {"long", "LibC::Long"},
    {"long_long", "LibC::LongLong"},
    {"unsigned_int", "LibC::UInt"},
    {"unsigned_short", "LibC::UShort"},
    {"unsigned_char", "LibC::UInt8"},
    {"unsigned_long", "LibC::ULong"},
    {"unsigned_long_long", "LibC::ULongLong"},
    {"float", "LibC::Float"},
    {"double", "LibC::Double"},
  ].each do |pair|
    assert_transform("simple", "fun just_#{pair[0]}", "fun just_#{pair[0]} : #{pair[1]}")
  end

  assert_transform("simple", "fun function_pointer", "fun function_pointer(x : LibC::Float, LibC::Char -> LibC::Int) : Void")
end