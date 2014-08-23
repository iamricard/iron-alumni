class PrivateController < ApplicationController
  before_action :authenticate_member!
end
