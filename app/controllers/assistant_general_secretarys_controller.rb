class AssistantGeneralSecretarysController < ApplicationController
  def index
    @assistant_general_secretarys = AssistantGeneralSecretary.all
  end
  
end
