class DashboardsController < ApplicationController
  before_action :require_login

  def index
    hat is mapped to the root (GET /). It has to list all the current problems for a user and all of the past solved ones.

You may have to fill more problems in db/seeds.rb for that too look okay. You may use problems from the first couple of weeks of the class. Or invent new ones! It's up to you!
  end
end
