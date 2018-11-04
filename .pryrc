Pry.config.editor = "emacsclient"
Pry.config.correct_indent = false if ENV["INSIDE_EMACS"]
# Hit Enter to repeat last command
Pry::Commands.command /^$/, "repeat last command" do
  _pry_.run_command Pry.history.to_a.last
end
