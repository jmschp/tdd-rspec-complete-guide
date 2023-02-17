require_relative '../lib/order'

RSpec.describe Order do
  describe '#is_filled' do
    context 'when stock is enough' do
      it 'completes the order' do
        # setup - data
        product_name = 'product_name'
        quantity = 50
        order = described_class.new(product_name, quantity)
        warehouse = instance_double('Warehouse') # setup Mock

        # setup - expectations - behavior verification
        expect(warehouse).to receive(:has_inventory?).once.with(product_name, quantity).and_return(true)
        expect(warehouse).to receive(:remove).once.with(product_name, quantity)

        # exercise
        order.fill(warehouse)

        # verify - In Rspec we do not need to declare the mock verify
        expect(order.filled?).to be(true)
      end
    end

    context 'when stock is not enough' do
      it 'does not completes the order' do
        # setup - data
        product_name = 'product_name'
        quantity = 51
        order = described_class.new(product_name, quantity)
        warehouse = instance_double('Warehouse') # setup Mock
        mail_service = instance_double('MailService', send: nil)

        # setup - expectations - behavior verification
        expect(warehouse).to receive(:has_inventory?).once.with(product_name, quantity).and_return(false)
        expect(warehouse).not_to receive(:remove)

        # exercise
        order.mailer_service(mail_service)
        order.fill(warehouse)

        # verify - In Rspec we do not need to declare the mock verify
        expect(order.filled?).to be(false)
      end

      it 'sends email' do
        # setup - data
        product_name = 'product_name'
        quantity = 51
        order = described_class.new(product_name, quantity)
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

        # verify - In Rspec we do not need to declare the mock verify
        expect(order.filled?).to be(false)
        expect(mail_service.number_sent).to eq(1) # Verify stub state
      end
    end
  end
end
