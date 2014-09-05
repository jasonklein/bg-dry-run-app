class AddReportRunToBaseModules < ActiveRecord::Migration
  def change
    add_column :base_modules, :report_run, :boolean, default: false
  end
end
