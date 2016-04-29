class CategoryMailer < ApplicationMailer
  default from: 'mariogalvez17@gmail.com'
  
  def sendAlert(error)
     @error  = error
     mail(to: 'mariogalvez17@gmail.com', subject: 'Error en creacion de categoria')
  end

end
