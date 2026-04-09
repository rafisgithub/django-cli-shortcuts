Hello,

I hope you are doing well.

Please follow the steps below to set up the Stripe webhook and generate the webhook signing secret.

Step 1: Login to Stripe

1. Go to [https://dashboard.stripe.com](https://dashboard.stripe.com)
2. Log in to your Stripe account.

Step 2: Create Webhook Endpoint

3. From the left sidebar, click Developers.
4. Click on Webhooks.
5. Click “Add endpoint”.
6. In the Endpoint URL field, enter the following URL:

   [http://dashboard.vantafy.com/api/stripe-webhook/](http://dashboard.vantafy.com/api/stripe-webhook/)

7. Under Events to send, click Select events and choose the following events:

   - checkout.session.completed
   - customer.subscription.created
   - customer.subscription.updated
   - customer.subscription.deleted
   - invoice.paid
   - invoice.payment_failed

8. Click Add endpoint.

### Step 3: Get Webhook Signing Secret

9. After the endpoint is created, click on it from the list.
10. In the Signing secret section, click Reveal.
11. Copy the Webhook Signing Secret (it starts with `whsec_`).

Please share this webhook secret with us so we can properly configure the subscription webhook on the server.

If you face any issue during the setup, feel free to let me know.

Best regards,

