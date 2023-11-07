class ContactoMailer < ApplicationMailer


  def enviar_solicitud_contacto_cuidador(solicitud, cuidador, user = nil)
    @solicitud = solicitud
    @cuidador = cuidador
    if user
      @user = user
    end
    mail(to: @cuidador.email, subject: 'Solicitud de contacto de un usuario')
  end
end
