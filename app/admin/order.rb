ActiveAdmin.register Order do
  permit_params :status_id,
                :customer_id,
                :pst_rate,
                :gst_rate,
                :hst_rate
end
