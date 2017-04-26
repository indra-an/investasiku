class AddInvestmentTipToPreferences < ActiveRecord::Migration[5.0]
  def change
    add_reference :preferences, :investment_tip, foreign_key: true
  end
end
