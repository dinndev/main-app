
pp = proc { |f, ltype, indent, line_no| "\e[33mChatpack\e[0m  > #{Company.current_tenant} " }
def pp.dup
  call
end

IRB.conf[:PROMPT][:DEFAULT] = {
  PROMPT_I: pp,
  PROMPT_N: nil,
  PROMPT_S: nil,
  PROMPT_C: nil,
  RETURN:  "=> %s\n"
}

require 'rubygems'
require 'hirb'
Hirb.enable :output=>{'Object'=>{:class=>:auto_table, :ancestor=>true}}
