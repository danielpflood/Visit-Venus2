class PagesController < ApplicationController
  def home
    @title="Home"
  end

  def contact
    @title="Contact"
  end

  def media
    @title="Media"
     
  end

  def forum
    @title="Forum"
  end
  def visiting
    @title="Visiting"
  end
end
