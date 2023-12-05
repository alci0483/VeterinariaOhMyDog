class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome
    email= params[:email]
    @codigo=params[:codigo]
    @greeting = "Gracias por Publicar un perrito encontrado, tu codigo para modificar la publicacion es : "

    mail to: email
  end
end
