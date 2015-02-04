John
====

Can I go?


### Usage

    $ bundle exec foreman start

Open a web browser: `http://localhost:9393`

### Running with init.d

You may need to use sudo for these commands:

    $ cp scripts/john.init.d.sample /etc/init.d/john
    $ chmod +x /etc/init.d/john
    $ /etc/init.d/john start
