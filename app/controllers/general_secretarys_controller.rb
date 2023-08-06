class GeneralSecretarysController < ApplicationController
  def index
    @general_secretarys = GeneralSecretary.all
  end
  
end
