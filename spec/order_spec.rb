require_relative '../lib/order'

RSpec.describe Order do
  describe '#is_filled' do
    context 'when stock is enough' do
      it 'completes the order' do
        # In here we are using a Mock.
        # Because we are doing behavior verification in our Warehouse double.

        # setup - data
        product_name = 'product_name'
        quantity = 50
        order = Order.new(product_name, quantity)
        warehouse = instance_double('Warehouse') # setup Double

        # setup - expectations - behavior verification
        expect(warehouse).to receive(:has_inventory?).once.with(product_name, quantity).and_return(true)
        expect(warehouse).to receive(:remove).once.with(product_name, quantity)

        # exercise
        order.fill(warehouse)

        # verify
        expect(order.filled?).to be(true)
      end

      it 'completes the order with spy syntax' do
        # In here we are using a Mock.
        # Because we are doing behavior verification in our Warehouse double.

        # setup - data
        product_name = 'product_name'
        quantity = 50
        order = Order.new(product_name, quantity)

        # setup Double
        warehouse = instance_double('Warehouse')
        allow(warehouse).to receive(:has_inventory?).with(product_name, quantity).and_return(true)
        allow(warehouse).to receive(:remove).once.with(product_name, quantity)

        # exercise
        order.fill(warehouse)

        # verify
        expect(order.filled?).to be(true)
        expect(warehouse).to have_received(:has_inventory?).once.with(product_name, quantity)
        expect(warehouse).to have_received(:remove).once.with(product_name, quantity)
      end
    end

    context 'when stock is not enough' do
      it 'does not completes the order' do
        # In here we are using a Mock
        # Because we are doing behavior verification in our Warehouse double

        # setup - data
        product_name = 'product_name'
        quantity = 51
        order = Order.new(product_name, quantity)
        warehouse = instance_double('Warehouse') # setup Mock
        mail_service = instance_double('MailService', send: nil)

        # setup - expectations - behavior verification
        expect(warehouse).to receive(:has_inventory?).once.with(product_name, quantity).and_return(false)
        expect(warehouse).not_to receive(:remove)

        # exercise
        order.mailer_service(mail_service)
        order.fill(warehouse)

        # verify
        expect(order.filled?).to be(false)
      end

      it 'sends email using stub' do
        # In here we are using a Stub
        # We create a double that will mimic the the email service.
        # We are not verifying the behavior of our MailService double.
        # But we can, and we are verifying the state of the MailService double.

        # setup - data
        product_name = 'product_name'
        quantity = 51
        order = Order.new(product_name, quantity)
        warehouse = instance_double('Warehouse', has_inventory?: false, remove: nil)
        mail_service = instance_double('MailService', messages: [])

        # setup - stub
        allow(mail_service).to receive(:send) do |message|
          mail_service.messages.push(message)
        end

        allow(mail_service).to receive(:number_sent).with(no_args) do
          mail_service.messages.length
        end

        # exercise
        order.mailer_service(mail_service)
        order.fill(warehouse)

        # verify
        expect(order.filled?).to be(false)
        # verify stub state
        expect(mail_service.number_sent).to eq(1)
      end

      it 'sends email using mock' do
        # In here we are using a Mock.
        # Because we are verifying the behavior of our MailService double.

        # setup - data
        product_name = 'product_name'
        quantity = 51
        order = Order.new(product_name, quantity)
        warehouse = instance_double('Warehouse', has_inventory?: false, remove: nil)
        mail_service = instance_double('MailService')

        # setup - expectations - behavior verification
        expect(mail_service).to receive(:send).once.with('Order not completed').and_return(nil)

        # exercise
        order.mailer_service(mail_service)
        order.fill(warehouse)

        # verify
        expect(order.filled?).to be(false)
      end
    end
  end
end
