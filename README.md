# write\_xlsx\_rails

Gem for generate Excel files from Rails views with [write\_xlsx](https://github.com/cxn03651/write_xlsx).

## Installation

Add this line to your application's Gemfile:

    gem 'write_xlsx_rails'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install write_xlsx_rails

## Usage

write\_xlsx\_rails provides a renderer and a template handler. It adds the :xlsx format and parses .xlsx.wxlsx templates.

###Controller

You can either use the typical format:

```ruby
respond_to do |format|
  format.xlsx
end
```

or call render directly:

```ruby
render xlsx: "foobar", filename: "annual-report", disposition: 'inline'
```

If you merely want to specify a file name, you can do it one of two ways:

```ruby
format.xlsx {
	response.headers['Content-Disposition'] = 'attachment; filename="my_new_filename.xlsx"'
}
```

or

```ruby
format.xlsx {
  render xlsx: "action_or_template", disposition: "attachment", filename: "my_new_filename.xlsx"
}
```

> NOTE: Someday it would be nice to merely say something like:
	render :filename, 'blah.xlsx"

###Template

Use the .xlsx.wxlsx extension in the template, use `workbook` variable, which is set with WriteXLSX.new:

```ruby
# Add a worksheet
worksheet = workbook.add_worksheet

# Add and define a format
format = workbook.add_format # Add a format
format.set_bold
format.set_color('red')
format.set_align('center')

# Write a formatted and unformatted string, row and column notation.
col = row = 0
worksheet.write(row, col, "Hi Excel!", format)
worksheet.write(1,   col, "Hi Excel!")

# Write a number and a formula using A1 notation
worksheet.write('A3', 1.2345)
worksheet.write('A4', '=SIN(PI()/4)')
```

If you use [acts\_as\_xlsx](https://github.com/randym/acts_as_xlsx), configure the active record normally, but specify the package in the template:

```ruby
User.to_xlsx package: xlsx_package, (other options)
```

####Partials

Partials work as expected:

```ruby
render partial: 'header', locals: { worksheet: worksheet }
```

##Dependencies

* [write\_xlsx](http://github.com/cxn03651/write_xlsx)

##Authors

* [Maxim Dobryakov](https://github.com/maxd)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

##Thanks

* Hideo Nakamura for [write\_xlsx](https://github.com/cxn03651/write_xlsx).
* Noel Peden for [axlsx](https://github.com/randym/axlsx) and [axlsx\_rails](https://github.com/straydogstudio/axlsx_rails).