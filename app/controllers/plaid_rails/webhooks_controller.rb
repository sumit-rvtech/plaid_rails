module PlaidRails
  class WebhooksController < ApplicationController
    
    def create
      webhook = PlaidRails::Webhook.find_by(item_id: params["item_id"])
      webhook.new_transactions = params['new_transactions']
      webhook.webhook_code = params["webhook_code"]
      webhook.webhook_type = params["webhook_type"]
      webhook.error = params["error"]
      webhook.save

      render json: webhook
    end
    
    private
    def webhook_params
      params.require(:webhook).permit(:webhook_type, :webhook_code,:error, 
        :item_id, :new_transactions, :removed_transactions, :code, :message,:access_token  )
    end
  end
end
