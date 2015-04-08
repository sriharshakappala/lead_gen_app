class BlackList < ActiveRecord::Base

  def self.open_spreadsheet(file)
  	case File.extname(file.original_filename)
      when '.csv' then Roo::CSV.new(file.path)
      when '.xlsx' then Roo::Excelx.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def self.import_from_file(file)		
    spreadsheet = BlackList.open_spreadsheet(file)
    start = 1
      (start..spreadsheet.last_row).each do |i|
      row_data = spreadsheet.row(i)
      blacklist = BlackList.new(:name => row_data[0])
      blacklist.save(:validate => false)
    end
  end

end
