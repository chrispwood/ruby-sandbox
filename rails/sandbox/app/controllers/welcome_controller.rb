require 'debugger'

class WelcomeController < ApplicationController
  before_action :do_stuff#, only: [:index]

  def index
    # debugger
    render(plain: "happy:\n#{@render_text}", :status => 200)
  end


  def do_stuff
    params.require(:what)
    @render_text = "in do stuff\n"
  end
end
