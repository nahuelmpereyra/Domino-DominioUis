package ar.edu.unq.domino.Mailing

import java.util.Properties
import javax.mail.Authenticator
import javax.mail.Message
import javax.mail.MessagingException
import javax.mail.PasswordAuthentication
import javax.mail.Session
import javax.mail.Transport
import javax.mail.internet.InternetAddress
import javax.mail.internet.MimeMessage
import ar.edu.unq.domino.Pizzas.Pedido

class GMailSender {

	UserPasswordAuthentication authentication

	new(String username, String password) {
		authentication = new UserPasswordAuthentication(username, password)
	}

	def sendMail(String to, String subject, String text) {

		try {
			val message = new MimeMessage(createSession)
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to))
			message.subject = subject
			message.text = text

			Transport.send(message)

		} catch (MessagingException e) {
			e.printStackTrace
			throw e
		}
	}

	private def createSession() {
		val props = new Properties => [
			put("mail.smtp.auth", "true")
			put("mail.smtp.starttls.enable", "true")
			put("mail.smtp.host", "smtp.gmail.com")
			put("mail.smtp.port", "587")
		]

		Session.getInstance(props, authentication)
	}

	public static GMailSender instance

	static def instancia() { instance }

	static def config(GMailSender sender) {
		instance = sender
	}

	def notificarPedidoEnViaje(Pedido pedido) {
		this.sendMail(pedido.cliente.email, "Domino Pizza's: Pedido en viaje", "Estimado/a " + pedido.cliente.nombre +
			", el pedido que realizo ya se encuentra en viaje.\n\nMuchas gracias por elegirnos!\n\nDomino Pizza's")
	}

	def notificarPedidoDemorado(Pedido pedido) {
		this.sendMail(pedido.cliente.email, "Domino Pizza's: Pedido demorado",
			"Mil disculpas " + pedido.cliente.nombre +
				", el pedido que realizo se encuentra demorado, esperamos que sepa comprendernos.\n\nDomino Pizza's")

			}

		}

		class UserPasswordAuthentication extends Authenticator {

			val String username
			val String password

			new(String _username, String _password) {
				username = _username
				password = _password
			}

			override protected getPasswordAuthentication() { new PasswordAuthentication(username, password) }

		}
		