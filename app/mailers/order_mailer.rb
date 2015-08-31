class OrderMailer < MandrillMailer::TemplateMailer
  default from: "info@houzome.com"
  default from_name: 'Houzome'

  def notify(order)
    mandrill_mail(

      template: 'order',
      subject: "Order Checkup (#{order.number})",
      to: order.email,
        # to: invitation.email,
        # to: { email: invitation.email, name: 'Honored Guest' },
      vars: {
        'NAME' => order.name,
        'ORDER_ID' => order.number,
        'PRICE' => (order.order_type == 'Normal') ? order.design.selling_price : order.price.blank? ? '' : order.price,
        'TANDF' => order.flat,
        'APARTMENT' => order.apartment_address,
        'STATUS' => order.aasm_state
      },

      important: true,
      inline_css: true,
    )
  end
end
